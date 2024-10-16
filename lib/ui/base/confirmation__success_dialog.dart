import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import 'custom_gradient_button.dart';
import 'custom_text.dart';

class ConfirmationSuccessDialog extends StatelessWidget {
  final String description;
  final String title;
  final String buttonName;
  final String buttonName1;
  final String? setImage;
  final Function? buttonPressed;
  final Function? button1Pressed;

  const ConfirmationSuccessDialog({
    super.key,
    required this.description,
    required this.title,
    this.buttonName = "",
    this.buttonName1 = "",
    this.buttonPressed,
    this.button1Pressed,
    this.setImage = Assets.imagesIcSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.all(30),
      backgroundColor: AppColors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(setImage!),
              3.h.sbh,
              CustomText(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryColor,
              ),
              1.h.sbh,
              CustomText(
                maxLine: 15,
                text: description,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
                textAlign: TextAlign.center,
              ),
              3.h.sbh,
              buttonName.isNotEmpty
                  ? CustomGradientButton(
                      buttonText: buttonName,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      width: MediaQuery.of(context).size.width,
                      onPressed: () => buttonPressed!(),
                      buttonColor: AppColors.primaryColor,
                      height: 6.h,
                      fontFamily: Assets.fontsUrbanistBold,
                      gradient0: AppColors.secondaryColor,
                      gradient1: AppColors.tertiaryColor,
                    )
                  : 0.h.sbh,
              buttonName1.isNotEmpty ? 2.h.sbh : 0.h.sbh,
              buttonName1.isNotEmpty
                  ? CustomGradientButton(
                      buttonText: buttonName1,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      width: MediaQuery.of(context).size.width,
                      onPressed: () => button1Pressed!(),
                      buttonColor: AppColors.primaryColor,
                      height: 6.h,
                      textColor: AppColors.secondaryColor,
                      fontFamily: Assets.fontsUrbanistBold,
                      gradient0: AppColors.secondaryColor.withAlpha(15),
                      gradient1: AppColors.tertiaryColor.withAlpha(15),
                    )
                  : 0.h.sbh,
            ],
          ),
        ),
      ),
    );
  }
}
