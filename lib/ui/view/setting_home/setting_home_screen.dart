import 'package:dealse/generated/assets.dart';
import 'package:dealse/routes/app_pages.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/ui/base/custom_text_form_field.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_constants.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:dealse/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';

class SettingHomeScreen extends StatefulWidget {
  const SettingHomeScreen({super.key});

  @override
  State<SettingHomeScreen> createState() => _SettingHomeScreenState();
}

class _SettingHomeScreenState extends State<SettingHomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          _personalInfo(),
          3.h.sbh,
          _appSetting()
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.all(15),
      color: AppColors.primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.setting,
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
            color: AppColors.white,
          ),
          const Spacer(),
          GestureDetector(
              onTap: () => Get.toNamed(Routes.notification),
              child: SvgPicture.asset(Assets.imagesIcNotification,colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),)),
        ],
      ),
    );
  }

  Widget _personalInfo() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.personalInformation,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
          3.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcEmailExp),
              10.sbw,
              CustomText(
                text: AppStrings.tempEmail,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          2.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcKey),
              10.sbw,
              CustomText(
                text: AppStrings.changePassword,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          2.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcBell),
              10.sbw,
              CustomText(
                text: AppStrings.autoSubscribe,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _appSetting() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppStrings.appSettings,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
          3.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcRightB),
              10.sbw,
              CustomText(
                text: AppStrings.permissionsSettings,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          2.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcRightB),
              10.sbw,
              CustomText(
                text: AppStrings.notificationsSettings,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          2.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcRightB),
              10.sbw,
              CustomText(
                text: AppStrings.privacySecurity,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          2.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcRightB),
              10.sbw,
              CustomText(
                text: AppStrings.helpAndSupport,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          2.h.sbh,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcRightB),
              10.sbw,
              CustomText(
                text: AppStrings.about,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
