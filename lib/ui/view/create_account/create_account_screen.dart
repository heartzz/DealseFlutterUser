import 'package:dealse/generated/assets.dart';
import 'package:dealse/routes/app_pages.dart';
import 'package:dealse/ui/base/custom_gradient_button.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/ui/base/custom_text_form_field.dart';
import 'package:dealse/ui/view/create_account/create_account_controller.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:dio/io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

import '../../base/custom_appbar.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final FocusNode emailFocus = FocusNode();
  final FocusNode userFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  CreateAccountController controller = Get.find();
  ValueNotifier userCredential = ValueNotifier('');


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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomAppBar(
                  onBackPressed: () => Get.back(),
                ),
                2.h.sbh,
                headerTitle(),
                5.h.sbh,
                emailWidget(),
                2.h.sbh,
                userNameWidget(),
                2.h.sbh,
                phoneWidget(),
                2.h.sbh,
                passwordWidget(),
                2.h.sbh,
                signUpButton(),
                5.h.sbh,
                orContinue(),
                5.h.sbh,
                socialButton(),
                5.h.sbh,
                alreadyHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerTitle() {
    return CustomText(
      text: AppStrings.createYourAccount,
      textAlign: TextAlign.start,
      fontSize: 30.sp,
      maxLine: 2,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    );
  }

  Widget emailWidget() {
    return CustomTextFormField(
        focusNode: emailFocus,
        nextFocus: passwordFocus,
        textEditingController: controller.emailController,
        labelText: AppStrings.email,
        textColor: AppColors.textColor,
        inputType: TextInputType.emailAddress,
        isPreFixIcon: true,
        inputAction: TextInputAction.next,
        prefixIcon: Assets.imagesIcEmail,
        fontFamily: Assets.fontsUrbanistMedium,
        fontSize: 13.sp);
  }
  Widget userNameWidget() {
    return CustomTextFormField(
        focusNode: userFocus,
        nextFocus: passwordFocus,
        textEditingController: controller.userController,
        labelText: AppStrings.userName,
        textColor: AppColors.textColor,
        inputType: TextInputType.text,
        isPreFixIcon: true,
        inputAction: TextInputAction.next,
        prefixIcon: Assets.imagesIcUserBlue,
        fontFamily: Assets.fontsUrbanistMedium,
        fontSize: 13.sp);
  }
  Widget phoneWidget() {
    return CustomTextFormField(
        focusNode: phoneFocus,
        nextFocus: passwordFocus,
        maxLength: 10,
        textEditingController: controller.phoneController,
        labelText: AppStrings.phoneNumber,
        textColor: AppColors.textColor,
        inputType: TextInputType.phone,
        isPreFixIcon: true,
        inputAction: TextInputAction.next,
        prefixIcon: Assets.imagesIcPhone,
        fontFamily: Assets.fontsUrbanistMedium,
        fontSize: 13.sp);
  }
  Widget passwordWidget() {
    return CustomTextFormField(
        textEditingController: controller.passwordController,
        labelText: AppStrings.password,
        textColor: AppColors.textColor,
        inputType: TextInputType.text,
        isPreFixIcon: true,
        focusNode: passwordFocus,
        isSufixIcon: true,
        inputAction: TextInputAction.done,
        prefixIcon: Assets.imagesIcLock,
        fontFamily: Assets.fontsUrbanistMedium,
        isPassword: true,
        fontSize: 13.sp);
  }

  Widget rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesIcUncheckBlue),
        2.w.sbw,
        CustomText(
          text: AppStrings.rememberMe,
          textAlign: TextAlign.start,
          fontSize: 12.sp,
          maxLine: 1,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
        )
      ],
    );
  }

  Widget signUpButton() {
    return CustomGradientButton(
      buttonText: AppStrings.signUp,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      width: MediaQuery.of(context).size.width,
      onPressed: () {
        controller.addUserForUserApp(4);
        },
      buttonColor: AppColors.primaryColor,
      height: 6.h,
      fontFamily: Assets.fontsUrbanistBold,
      gradient0: AppColors.secondaryColor,
      gradient1: AppColors.tertiaryColor,
    );
  }

  Widget orContinue() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(thickness: 2.5, color: AppColors.borderColor),
        ),
        2.w.sbw,
        CustomText(
          text: AppStrings.orContinueWith,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.hintGrayColor,
        ),
        2.w.sbw,
        const Expanded(
          child: Divider(thickness: 2.5, color: AppColors.borderColor),
        ),
      ],
    );
  }

  Widget socialButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(Assets.imagesIcButtonFacebook),
        InkWell(
            onTap: () async{
              userCredential.value = await signInWithGoogle();
              if (userCredential.value != null){
                controller.emailController.text=userCredential.value.user!.email.toString().trim();
                controller.userController.text=userCredential.value.user!.displayName.toString().trim();
                controller.addUserForUserAppSocial(1, userCredential!.value.user!.uid);


              }

            },
            child: SvgPicture.asset(Assets.imagesIcButtonGoogle)),
        SvgPicture.asset(Assets.imagesIcButtonApple),
      ],
    );
  }

  Widget alreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        CustomText(
          text: AppStrings.alreadyHaveAccount,
          fontSize: 12.sp,
          color: AppColors.hintColor,
        ),
        2.w.sbw,
        GestureDetector(
          onTap: () => Get.offAndToNamed(Routes.login),
          child: CustomText(
            text: AppStrings.signIn,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: AppColors.secondaryColor,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      signOutFromGoogle();
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );



      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }
  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
