import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/utility.dart';
import '../../base/custom_text.dart';
import '../../base/custom_text_form_field.dart';
import '../../base/custom_textformfield_with_border.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(),
                    20.sbh,
                    Center(child: profileImage()),
                    30.sbh,
                    customerForm(),
                    5.sbh,


                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }

  Widget _appBar(){
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        color: AppColors.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              Assets.imagesIcBack,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
          Spacer(),
          CustomText(
            text: AppStrings.editProfile,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          Spacer(),
          CustomText(
            text: AppStrings.save,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),// Placeholder for spacing
        ],
      ),
    );
  }
  Widget profileImage(){
    return  Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            Assets.imagesIcProfileTemp,
            height: 100,
            width: 100,
          ),
        ),
        Positioned(
            right: 0,
            bottom: 10,
            child: SvgPicture.asset(Assets.imagesIcRoundEdit,height: 25,width: 25,))
      ],
    );
  }
  Widget customerForm(){
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.firstName,
              textAlign: TextAlign.start,
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            2.sbh,
            CustomTextFormFieldWithBorder(
                textColor: AppColors.black,
                controller: firstNameController,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.enabledBorderColor),
                ),
                hintText:AppStrings.enterFirstName,
                keyboardType: TextInputType.text),
            10.sbh,
            CustomText(
              text: AppStrings.lastName,
              textAlign: TextAlign.start,
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            2.sbh,
            CustomTextFormFieldWithBorder(
                textColor: AppColors.black,
                controller: lastNameController,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.buttonColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.enabledBorderColor),
                ),
                hintText:AppStrings.enterLastName,
                keyboardType: TextInputType.text),
            10.sbh,
            CustomText(
              text: AppStrings.email,
              textAlign: TextAlign.start,
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            2.sbh,
            CustomTextFormFieldWithBorder(
                textColor: AppColors.black,
                controller: emailController,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.buttonColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.enabledBorderColor),
                ),
                hintText:AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress),
            10.sbh,
            CustomText(
              text: AppStrings.phoneNumber,
              textAlign: TextAlign.start,
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            2.sbh,
            CustomTextFormFieldWithBorder(
                textColor: AppColors.black,
                controller: phoneController,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.buttonColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.enabledBorderColor),
                ),
                hintText:AppStrings.enterPhoneNumber,
                keyboardType: TextInputType.phone),
            10.sbh,
            CustomText(
              text: AppStrings.dateofBirth,
              textAlign: TextAlign.start,
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            2.sbh,
            CustomTextFormFieldWithBorder(
                isEnabled: false,
                textColor: AppColors.black,
                controller: dateController,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.buttonColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: AppColors.enabledBorderColor),
                ),
                hintText:AppStrings.dateofBirth,
                keyboardType: TextInputType.datetime),
            10.sbh,

          ],
        ),
      ),
    );
  }



}
