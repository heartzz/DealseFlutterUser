import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  final Function? onBackPressed;
  final Function? onImage1Pressed;
  final Function? onImage2Pressed;
  final bool image1;
  final bool image2;
  final bool viewList;
  final String? backImage;
  final String? type;
  final String? image;

  const CustomAppBar(
      {super.key,
      this.text,
      this.onBackPressed,
      this.onImage1Pressed,
      this.onImage2Pressed,
      this.image1 = false,
      this.image2 = false,
      this.viewList = true,
      this.backImage = Assets.imagesIcArrowLeft,
      this.type = "",
      this.image = Assets.imagesIcAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          GestureDetector(
              onTap: () => onBackPressed!(),
              child: SvgPicture.asset(backImage!)),
          3.w.sbw,
          CustomText(
            text: text ?? "",
            fontSize: 16.sp,
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          image1
              ? type == ""
                  ? GestureDetector(
                      onTap: () => onImage1Pressed!(),
                      child: SvgPicture.asset(
                        viewList
                            ? Assets.imagesIcSelectList
                            : Assets.imagesIcList,
                        height: 3.3.h,
                        width: 3.3.w,
                      ),
                    )
                  : 0.h.sbh
              : 0.h.sbh,
          2.w.sbw,
          image2
              ? type == ""
                  ? GestureDetector(
                      onTap: () => onImage2Pressed!(),
                      child: SvgPicture.asset(
                        viewList
                            ? Assets.imagesIcGrid
                            : Assets.imagesIcSelectGrid,
                        height: 3.3.h,
                        width: 3.3.w,
                      ),
                    )
                  : type == "image"
                      ? GestureDetector(
                          onTap: () => onImage2Pressed!(),
                          child: SvgPicture.asset(
                            image!,
                            height: 3.3.h,
                            width: 3.3.w,
                          ),
                        )
                      : 0.h.sbh
              : 0.h.sbh,
        ],
      ),
    );
  }
}
