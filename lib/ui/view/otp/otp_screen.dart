import 'dart:async';

import 'package:dealse/generated/assets.dart';
import 'package:dealse/routes/app_pages.dart';
import 'package:dealse/ui/base/custom_appbar.dart';
import 'package:dealse/ui/base/custom_gradient_button.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomAppBar(
                  text: AppStrings.otp,
                  onBackPressed: () => Get.back(),
                ),
                5.h.sbh,
                Image.asset(
                  Assets.imagesIcLockYellow,
                  height: 22.h,
                  width: 80.w,
                ),
                5.h.sbh,
                instructionTitle(),
                8.h.sbh,
                otpView(),
                8.h.sbh,
                resendCode(),
                8.h.sbh,
                verifyButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget instructionTitle() {
    return CustomText(
      text: AppStrings.codeHasBeenSend,
      fontSize: 11.sp,
      maxLine: 2,
      color: AppColors.textColor,
      fontWeight: FontWeight.w400,
    );
  }

  Widget otpView() {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 80,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontFamily: Assets.fontsUrbanistBold,
          fontWeight: FontWeight.w700,
          fontSize: 20.sp),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        debugPrint("Completed: $pin");
      },
    );
  }

  Widget resendCode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: AppStrings.resendCode,
          fontSize: 11.sp,
          maxLine: 2,
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
        ),
        CustomText(
          text: '$secondsRemaining s',
          fontSize: 11.sp,
          maxLine: 2,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  Widget verifyButton() {
    return CustomGradientButton(
      buttonText: AppStrings.verify,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      width: MediaQuery.of(context).size.width,
      onPressed: () {
        Get.toNamed(Routes.resetPassword);
      },
      buttonColor: AppColors.primaryColor,
      height: 6.h,
      fontFamily: Assets.fontsUrbanistBold,
      gradient0: AppColors.secondaryColor,
      gradient1: AppColors.tertiaryColor,
    );
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }
}
