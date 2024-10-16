import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dots_indicator.dart';
import '../../base/custom_gradient_button.dart';
import '../../base/custom_gradient_text.dart';
import '../../base/custom_text.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController controller = PageController();
  var pageIndex = 0;
  RxString pageTag = AppStrings.introNext.obs;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      introPage1(),
      introPage2(),
      introPage3(),

    ];
    return Container(
      child: SafeArea(
          child: Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesIcInroOne)
                  , fit: BoxFit.cover
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: pageView(pages),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 10.sp),
                  child: Row(
                    children: [
                      buildDotsIndicator(pages),
                      const Spacer(),
                      nextButton(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget introPage1() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesIcInroOne),
          alignment: Alignment.topRight,
        ),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            10.sbh,
            skipButton(),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: AppStrings.onBoardingTitles[0],
                  textAlign: TextAlign.start,
                  fontSize: 20.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                CustomText(
                  text: AppStrings.onBoardingTitlesHighlightText[0],
                  textAlign: TextAlign.start,
                  fontSize: 12.sp,
                  maxLine: 4,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintGrayColor,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget introPage2() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesIcInroOne),
          alignment: Alignment.topRight,
        ),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            10.sbh,
            skipButton(),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: AppStrings.onBoardingTitles[1],
                  textAlign: TextAlign.start,
                  fontSize: 20.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                CustomText(
                  text: AppStrings.onBoardingTitlesHighlightText[1],
                  textAlign: TextAlign.start,
                  fontSize: 12.sp,
                  maxLine: 4,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintGrayColor,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget introPage3() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(Assets.imagesIcInroOne),
        alignment: Alignment.topRight,
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.onBoardingTitles[2],
              textAlign: TextAlign.start,
              fontSize: 20.sp,
              maxLine: 10,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              text: AppStrings.onBoardingTitlesHighlightText[2],
              textAlign: TextAlign.start,
              fontSize: 12.sp,
              maxLine: 4,
              color: AppColors.hintGrayColor,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  PageView pageView(List<Widget> pages) {
    return PageView(
      controller: controller,
      children: pages,
      onPageChanged: (index) {
        pageIndex = index;
        pageTag.value =
            pageIndex == 2 ? AppStrings.introStart : AppStrings.introNext;
      },
    );
  }

  Obx nextButton() {
    return Obx(
      () {
        return InkWell(
          onTap: ()
            {
              if (pageTag.value == AppStrings.introStart) {
                Get.offAndToNamed(Routes.login);
              }
              controller.animateToPage(pageIndex + 1,
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  curve: Curves.fastOutSlowIn);

          },
          child: CustomGradientText(
            color: AppColors.black,
            text: pageTag.value,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            fontFamily: Assets.fontsUrbanistBold,
          ),
        );
      },
    );
  }

  Widget skipButton() {
    return InkWell(
      onTap: () {
        Get.offAndToNamed(Routes.login);
      },
      child: CustomGradientText(
        text: AppStrings.introSkip,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.fontsUrbanistBold,
        color: AppColors.black,
      ),
    );
  }

  Widget buildDotsIndicator(List<Widget> pages) {
    return DotsIndicator(
      controller: controller,
      itemCount: pages.length,
      colorActive: AppColors.primaryColor.withAlpha(90),
      colorInActive: AppColors.indicatorGray.withAlpha(90),
    );
  }
}
