import 'dart:async';
import 'dart:io';

import 'package:dealse/generated/assets.dart';
import 'package:dealse/ui/base/confirmation__success_dialog.dart';
import 'package:dealse/ui/base/custom_gradient_text.dart';
import 'package:dealse/ui/base/custom_text.dart';
import 'package:dealse/ui/view/history_home/history_home_screen.dart';
import 'package:dealse/ui/view/profile/profile_home_screen.dart';
import 'package:dealse/ui/view/setting_home/setting_home_screen.dart';
import 'package:dealse/utils/app_colors.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../base/custom_snackbar.dart';
import '../user_home/user_home_screen.dart';





class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _canExit = false;
  RxInt selectedIndex = 0.obs;

  void updateTabSelection(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (_canExit) {
          if (GetPlatform.isAndroid) {
            SystemNavigator.pop();
          } else if (GetPlatform.isIOS) {
            exit(0);
          }
        } else {
          showCustomSnackBar(AppStrings.backPressAgainToExist, isError: false);
          _canExit = true;
          Timer(const Duration(seconds: 3), () {
            _canExit = false;
          });
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.white,
          key: _scaffoldKey,
          body: SafeArea(
            child: Obx(
              () {
                return selectedIndex.value == 0
                    ? const UserHomeScreen()
                    : selectedIndex.value == 1
                        ? const HistoryHomeScreen()
                        : selectedIndex.value == 2
                            ? const SettingHomeScreen()
                            : selectedIndex.value == 3
                              ? const ProfileHomeScreen()
                              : const UserHomeScreen();
              },
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withAlpha(25),
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomAppBar(
              color: AppColors.white,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.only(left: 2.h, right: 2.h),
                child: Obx(() {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => updateTabSelection(0),
                        child: selectedIndex.value == 0
                            ? bottomSelectorItem(
                                AppStrings.home, Assets.imagesIcHomeSelect)
                            : bottomItem(AppStrings.home, Assets.imagesIcHome),
                      ),
                      GestureDetector(
                        onTap: () => updateTabSelection(1),
                        child: selectedIndex.value == 1
                            ? bottomSelectorItem(
                                AppStrings.history, Assets.imagesIcHistorySelect)
                            : bottomItem(
                                AppStrings.history, Assets.imagesIcHistory),
                      ),
                      GestureDetector(
                        onTap: () => updateTabSelection(2),
                        child: selectedIndex.value == 2
                            ? bottomSelectorItem(AppStrings.setting,
                                Assets.imagesIcSettingSelect)
                            : bottomItem(
                                AppStrings.setting, Assets.imagesIcSetting),
                      ),
                      GestureDetector(
                        onTap: () => updateTabSelection(3),
                        child: selectedIndex.value == 3
                            ? bottomSelectorItem(AppStrings.profile,
                                Assets.imagesIcProfileSelect)
                            : bottomItem(
                                AppStrings.profile, Assets.imagesIcProfile),
                      ),
                      GestureDetector(
                        onTap: () => updateTabSelection(4),
                        child: selectedIndex.value == 4
                            ? bottomSelectorItem(AppStrings.more,
                                Assets.imagesIcMoreSelect)
                            : bottomItem(
                                AppStrings.more, Assets.imagesIcMore),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomItem(String label, String image) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          width: 20,
        ),
        CustomText(
          text: label,
          fontSize: 8.sp,
          color: AppColors.hintColor,
        )
      ],
    );
  }

  Widget bottomSelectorItem(String label, String image) {
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 20,
          ),
          1.w.sbw,
          CustomGradientText(
            text: label,
            fontFamily: Assets.fontsUrbanistMedium,
            fontSize: 8.sp,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
