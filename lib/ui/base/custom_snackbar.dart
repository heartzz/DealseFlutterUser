import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void showCustomSnackBar(String? message, {bool isError = true}) {
  if (message != null) {
    if (message.isNotEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: isError ? Colors.red : Colors.green,
          message: message,
          maxWidth: 1000.w,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          margin: EdgeInsets.all(1.5.h),
          borderRadius: 5.0,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    }
  }
}
