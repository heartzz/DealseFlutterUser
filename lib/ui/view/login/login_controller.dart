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


class LoginController extends GetxController {
  final TokenRepository authRepository;

  LoginController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isRememberMe = false.obs;

  Future<void> login(int type) async {
    if (isFormValid()) {
      Utility.showLoading();
      if (await InternetConnection().hasInternetAccess) {
        try {
          Map<String, dynamic> params = {
            "registrationType": type,
            "mobileNumber": emailController.text.trim().toString(),
            "facebookId": "",
            "appleId": "",
            "googleId": "",
            "deviceType":Constants.deviceType,
            "deviceID": Constants.deviceID ,
          };
          Response response = await authRepository.login(params: params);
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
  Future<void> socialLogin(int type,String socialId) async {
      Utility.showLoading();
      if (await InternetConnection().hasInternetAccess) {
        try {
          Map<String, dynamic> params = {
            "registrationType": type,
            "mobileNumber": "",
            "facebookId": "",
            "appleId": "",
            "googleId":socialId,
            "deviceType":Constants.deviceType,
            "deviceID": Constants.deviceID ,
          };
          Response response = await authRepository.login(params: params);
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
      Utility.showToastMessage(AppStrings.enterPhoneNumber);
      return false;
    } else if (!GetUtils.isPhoneNumber(emailController.text.toString())) {
      Utility.showToastMessage(AppStrings.enterPhoneNumber);
      return false;
    }
    return true;
  }
}
