import 'package:dealse/generated/assets.dart';
import 'package:dealse/routes/app_pages.dart';
import 'package:dealse/ui/base/custom_gradient_button.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/ui/base/custom_text_form_field.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

import '../../base/custom_appbar.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.find();

  ValueNotifier userCredential = ValueNotifier('');
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;



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
                phoneWidget(),
                2.h.sbh,


                rememberMe(),
                5.h.sbh,
                signInButton(),
                5.h.sbh,


                orContinue(),
                5.h.sbh,
                socialButton(),
                5.h.sbh,
                dontHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerTitle() {
    return CustomText(
      text: AppStrings.loginToYourAccount,
      textAlign: TextAlign.start,
      fontSize: 30.sp,
      maxLine: 2,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    );
  }

  Widget phoneWidget() {
    return CustomTextFormField(
        focusNode: phoneFocus,
        nextFocus: passwordFocus,
        maxLength: 10,
        textEditingController: controller.emailController,
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
        focusNode: passwordFocus,
        textEditingController: controller.passwordController,
        labelText: AppStrings.password,
        textColor: AppColors.textColor,
        inputType: TextInputType.text,
        isPreFixIcon: true,
        isSufixIcon: true,
        inputAction: TextInputAction.done,
        prefixIcon: Assets.imagesIcLock,
        fontFamily: Assets.fontsUrbanistMedium,
        isPassword: true,
        fontSize: 13.sp);
  }

  Widget rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
        ),
        Spacer(),
        forgotPassword(),
      ],
    );
  }

  Widget signInButton() {
    return CustomGradientButton(
      buttonText: AppStrings.signIn,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      width: MediaQuery.of(context).size.width,
      onPressed:(){
    controller.login(4);
    },
      /*() {
          // Get.toNamed(Routes.userDashboard);
      }*/
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
        InkWell(
            onTap: () async {

              } ,
            child: SvgPicture.asset(Assets.imagesIcButtonFacebook)),
        InkWell(
            onTap: () async{
              userCredential.value = await signInWithGoogle();
              if (userCredential.value != null){
                controller.socialLogin(1, userCredential!.value.user!.uid);
                print(userCredential.value.user!.uid);
                print(userCredential.value.user!.email);

              }

            },
            child: SvgPicture.asset(Assets.imagesIcButtonGoogle)),
        SvgPicture.asset(Assets.imagesIcButtonApple),
      ],
    );
  }

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text.trim(),
      );
      print("User signed up: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    }
  }
  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text.trim(),
      );
      print("User signed in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    }
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
        ),
        2.w.sbw,
        GestureDetector(
          onTap: () => Get.toNamed(Routes.createAccount),
          child: CustomText(
            text: AppStrings.signUp,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: AppColors.secondaryColor,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget forgotPassword() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.forgotPassword),
      child: Align(
        alignment: Alignment.center,
        child: CustomText(
          text: AppStrings.forgotThePassword,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: AppColors.secondaryColor,
          textAlign: TextAlign.center,
        ),
      ),
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

  Future<void> googleSignUp() async {
    try{
      signOutFromGoogle();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        print("Token-->"+googleSignInAuthentication.accessToken.toString());
      }
    }on Exception catch(e){
      print('exception->$e');
    }

  }

  Future<void> signInWithEmailPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text.trim(),
      );
      // Handle successful sign-in (e.g., navigate to another screen)
      print('successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      } else if (e.code == 'invalid-email') {
        print('The email address is not valid.');
      } else if (e.code == 'invalid-credential') {
        print('The supplied auth credential is incorrect, malformed, or has expired.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print(e);
    }
  }
}
