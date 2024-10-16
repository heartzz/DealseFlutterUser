import 'dart:async';
import 'dart:convert';

import 'package:dealse/ui/view/splash/token_controller.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';


import '../../../data/constants.dart';
import '../../../generated/assets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../base/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TokenController controller = Get.find();
  @override
  void initState() {
    super.initState();
    printDeviceId();
    if(GetStorage().read(Constants.accessToken)==null||GetStorage().read(Constants.accessToken)==""){
      controller.getAuthenticateToken();
    }else{
      print("token: Bearer  "+GetStorage().read(Constants.accessToken));
      _route();
    }
  }
  Future<void> printDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    String platform = '2';
    String deviceToken = '';
    String deviceVersion = '';
    String userType = '';
    if (GetPlatform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceVersion =
      '${iosDeviceInfo.name}:(${iosDeviceInfo.systemVersion})'; // unique ID on iOS
      deviceToken =
          iosDeviceInfo.identifierForVendor.toString(); // unique ID on iOS
      userType = 'iOS';
      Constants.deviceType='iOS';
      Constants.deviceID=iosDeviceInfo.identifierForVendor.toString();
      platform = jsonEncode(iosDeviceInfo.data);
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceVersion =
      '${androidDeviceInfo.device}(${androidDeviceInfo.version.release})';
      deviceToken = androidDeviceInfo.id;
      Constants.deviceType='Android';
      Constants.deviceID=androidDeviceInfo.id;// unique ID on android
      userType = 'Android';
      platform = jsonEncode(androidDeviceInfo.data);
    }
    print("deviceId: "+deviceToken);
  }

  void _route() async {
    Timer(
        const Duration(seconds: 5),
            () => (GetStorage().read(Constants.isLoggedIn) ?? false) == true
            ? Get.offNamed(Routes.userDashboard)
            : redirect());
  }

  Future<void> redirect() async {
    Get.offAndToNamed(Routes.introduction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(color: AppColors.primaryColor),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                child: Padding(
                  padding: EdgeInsets.only(left: 2.h, right: 2.h, bottom: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.appName,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                      CustomText(
                        text: AppStrings.offersThatMattersForYou,
                        fontSize: 12.sp,
                        maxLine: 1,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
