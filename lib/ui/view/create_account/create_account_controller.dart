import 'package:dealse/data/model/register_response_entity.dart';
import 'package:dealse/repositories/token_repository.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../data/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/utility.dart';


class CreateAccountController extends GetxController {
  final TokenRepository authRepository;

  CreateAccountController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();


  RxBool isRememberMe = false.obs;

  Future<void> addUserForUserApp(int type) async {
    if (isFormValid()) {
      Utility.showLoading();
      if (await InternetConnection().hasInternetAccess) {
        try {
          Map<String, dynamic> params = {
            "name": userController.text.trim().toString(),
            "email": emailController.text.trim().toString(),
            "mobileNo": phoneController.text.trim().toString(),
            "facebookId": "",
            "appleId": "",
            "googleId": "",
            "registrationType": type,
            "deviceID": Constants.deviceID ,
            "deviceType":Constants.deviceType
          };
          Response response = await authRepository.addUserForUserApp(params: params);
          Utility.hideLoading();
          if (response.statusCode == 200) {
            RegisterResponseEntity responseModel =
            RegisterResponseEntity.fromJson(response.data);
            await GetStorage()
                .write(Constants.customerID, responseModel.data.userID);
            await GetStorage().write(Constants.isLoggedIn, true);
            Utility.showToastMessage(AppStrings.loggedInSuccessfully);
            Get.offAllNamed(Routes.userDashboard);
          } else {
            Utility.showToastMessage(response.data);
          }
        } catch (e) {
          print('Error occured: $e');
          Utility.hideLoading();
          // Utility.showToastMessage(AppStrings.commonErrorMessage);
        }
      } else {
        Utility.hideLoading();
        Utility.showToastMessage(AppStrings.internetConnectionError);
      }
    }
  }
  Future<void> addUserForUserAppSocial(int type,String socialId) async {
      Utility.showLoading();
      if (await InternetConnection().hasInternetAccess) {
        try {
          Map<String, dynamic> params = {
            "name": userController.text.trim().toString(),
            "email": emailController.text.trim().toString(),
            "mobileNo": phoneController.text.trim().toString(),
            "facebookId": "",
            "appleId": "",
            "googleId": socialId,
            "registrationType": type,
            "deviceID": Constants.deviceID ,
            "deviceType":Constants.deviceType
          };
          Response response = await authRepository.addUserForUserApp(params: params);
          Utility.hideLoading();
          if (response.statusCode == 200) {
            RegisterResponseEntity responseModel =
            RegisterResponseEntity.fromJson(response.data);
            await GetStorage()
                .write(Constants.customerID, responseModel.data.userID);
            await GetStorage().write(Constants.isLoggedIn, true);
            Utility.showToastMessage(AppStrings.loggedInSuccessfully);
            Get.offAllNamed(Routes.userDashboard);
          } else {
            Utility.showToastMessage(response.data);
          }
        } catch (e) {
          print('Error occured: $e');
          Utility.hideLoading();
          // Utility.showToastMessage(AppStrings.commonErrorMessage);
        }
      } else {
        Utility.hideLoading();
        Utility.showToastMessage(AppStrings.internetConnectionError);
      }

  }

  bool isFormValid() {
    if (emailController.text.toString().trim().isEmpty) {
      Utility.showToastMessage(AppStrings.enterEmail);
      return false;
    } else if (!GetUtils.isEmail(emailController.text.toString())) {
      Utility.showToastMessage(AppStrings.validEmail);
      return false;
    }else if (userController.text.toString().trim().isEmpty) {
      Utility.showToastMessage(AppStrings.enterUserName);
      return false;
    } else if (phoneController.text.toString().trim().isEmpty) {
      Utility.showToastMessage(AppStrings.enterPhoneNumber);
      return false;
    } else if (!GetUtils.isPhoneNumber(phoneController.text.toString())) {
      Utility.showToastMessage(AppStrings.enterPhoneNumber);
      return false;
    }else if (passwordController.text.toString().trim().isEmpty) {
      Utility.showToastMessage(AppStrings.enterPassword);
      return false;
    }
    return true;
  }
}
