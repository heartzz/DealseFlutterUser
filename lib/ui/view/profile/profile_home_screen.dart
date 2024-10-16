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

class ProfileHomeScreen extends StatefulWidget {
  const ProfileHomeScreen({super.key});

  @override
  State<ProfileHomeScreen> createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          header(),
          3.h.sbh,
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              Assets.imagesIcProfileTemp,
              height: 100,
              width: 100,
            ),
          ),
          3.h.sbh,
          CustomText(
            text: 'Smith Samson',
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: AppColors.black,
          ),
          2.sbh,
          CustomText(
            text: 'smithsamson@gmail.com',
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
            color: AppColors.hintGrayColor,
          ),
          20.sbh,
          menuList(),
          20.sbh,
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
            text: AppStrings.profile,
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
  Widget menuList(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcPercentage,height: 18,width: 18,),
              15.sbw,
              CustomText(
                text: AppStrings.myOffers,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              Spacer(),
              SvgPicture.asset(Assets.imagesIcRightPink,height: 18,width: 18,),
            ],
          ),
        ),
        10.sbh,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcProfileP,height: 18,width: 18,),
              15.sbw,
              CustomText(
                text: AppStrings.account,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              Spacer(),
              SvgPicture.asset(Assets.imagesIcRightPink,height: 18,width: 18,),
            ],
          ),
        ),
        10.sbh,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesIcFeedBack,height: 25,width: 25,),
              15.sbw,
              CustomText(
                text: AppStrings.feedback,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              Spacer(),
              SvgPicture.asset(Assets.imagesIcRightPink,height: 18,width: 18,),
            ],
          ),
        ),
        10.sbh,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIcInfo,height: 18,width: 18,),
              15.sbw,
              CustomText(
                text: AppStrings.information,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              Spacer(),
              SvgPicture.asset(Assets.imagesIcRightPink,height: 18,width: 18,),
            ],
          ),
        ),
        10.sbh,
        InkWell(
          onTap: () {
            Get.toNamed(Routes.editProfile);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesIcEdit,height: 18,width: 18,),
                15.sbw,
                CustomText(
                  text: AppStrings.editProfile,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                Spacer(),
                SvgPicture.asset(Assets.imagesIcRightPink,height: 18,width: 18,),
              ],
            ),
          ),
        ),

      ],
    );
  }


}
