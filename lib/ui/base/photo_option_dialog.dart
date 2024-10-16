import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_string.dart';
import 'custom_text.dart';


class PhotoOptionDialog extends StatelessWidget {
  final Function onCameraPressed;
  final Function onGalleryPressed;

  const PhotoOptionDialog(
      {super.key,
      required this.onCameraPressed,
      required this.onGalleryPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: EdgeInsets.all(3.h),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CustomText(
                text: AppStrings.choose,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
            1.5.h.sbh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onCameraPressed();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 5.h,
                          ),
                          1.h.sbh,
                          CustomText(
                            text: AppStrings.camera,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onGalleryPressed();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Icon(
                            Icons.photo,
                            size: 5.h,
                          ),
                          1.h.sbh,
                          CustomText(
                            text: AppStrings.gallery,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
