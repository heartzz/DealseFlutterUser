import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


ThemeData basicTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    disabledColor: AppColors.secondaryColor,
    brightness: Brightness.light,
    hintColor: AppColors.hintColor,
    cardColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor)),
    colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            secondary: AppColors.primaryColor,
            surface: AppColors.white)
        .copyWith(surface: AppColors.white),
  );
}
