import 'package:dealse/generated/assets.dart';
import 'package:dealse/ui/base/custom_gradient_button.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              children: [
                1.h.sbh,
                header(),
                8.h.sbh,
                headerTitle(),
                8.h.sbh,
                commonLoginButtons(
                    Assets.imagesIcFacebook, AppStrings.continueWithFacebook),
                2.h.sbh,
                commonLoginButtons(
                    Assets.imagesIcGoogle, AppStrings.continueWithGoogle),
                2.h.sbh,
                commonLoginButtons(
                    Assets.imagesIcApple, AppStrings.continueWithApple),
                5.h.sbh,
                orLabel(),
                5.h.sbh,
                signInPasswordButton(),
                8.h.sbh,
                dontHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Align(
      alignment: Alignment.topCenter,
      child: SvgPicture.asset(
        Assets.imagesIcLogoHeaderWithName,
      ),
    );
  }

  Widget headerTitle() {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomText(
        text: AppStrings.letsYouIn,
        fontSize: 35.sp,
        color: AppColors.textColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget commonLoginButtons(String image, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        backgroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 3.w,
            height: 3.h,
          ),
          10.sbw,
          CustomText(
              fontWeight: FontWeight.w600,
              text: text,
              fontSize: 13.sp)
        ],
      ),
    );
  }

  Widget orLabel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(thickness: 2.5, color: AppColors.borderColor),
        ),
        10.sbw,
        CustomText(
          text: AppStrings.or,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.hintGrayColor,
        ),
        10.sbw,
        const Expanded(
          child: Divider(thickness: 2.5, color: AppColors.borderColor),
        ),
      ],
    );
  }

  Widget signInPasswordButton() {
    return CustomGradientButton(
      buttonText: AppStrings.signInWithPassword,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      width: MediaQuery.of(context).size.width,
      onPressed: () => Get.toNamed(Routes.login),
      buttonColor: AppColors.primaryColor,
      height: 6.h,
      fontFamily: Assets.fontsUrbanistBold,
      gradient0: AppColors.secondaryColor,
      gradient1: AppColors.tertiaryColor,
    );
  }

  Widget dontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        CustomText(
          text: AppStrings.dontHaveAnAccount,
          fontSize: 12.sp,
          color: AppColors.hintColor,
          fontWeight: FontWeight.w400,
        ),
        2.w.sbw,
        GestureDetector(
          onTap: () => Get.toNamed(Routes.createAccount),
          child: CustomText(
            text: AppStrings.signUp,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryColor,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
