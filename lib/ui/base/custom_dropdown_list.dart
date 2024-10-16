import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomDropdownList extends StatelessWidget {
  final bool? displayLabelOnTop;
  final String? dropdownValue;
  final List<String>? dropdownList;
  final Function(String?)? onChanged;
  final String fontFamily;
  final double fontSize;
  final String label;
  final String prefixIcon;
  final bool isPreFixIcon;
  final Color textColor;
  final bool isAsterisk;

  const CustomDropdownList(
      {super.key,
      this.dropdownValue,
      this.dropdownList,
      this.onChanged,
      required this.label,
      required this.fontFamily,
      required this.fontSize,
      this.displayLabelOnTop = true,
      this.isPreFixIcon = false,
      this.prefixIcon = Assets.imagesIcArrowLeft,
      this.textColor = AppColors.textColor,
      this.isAsterisk = true});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      isDense: true,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      decoration: InputDecoration(
        contentPadding: isPreFixIcon == false
            ? EdgeInsets.only(right: 1.h, bottom: 2.h, top: 2.h, left: 1.7.h)
            : EdgeInsets.zero,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: isPreFixIcon
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.isTablet ? 1.1.h : 1.5.h,
                    vertical: context.isTablet ? 1.3.h : 1.5.h),
                child: Image.asset(
                  prefixIcon,
                  width: context.isTablet ? 3.5.w : 2.w,
                  height: context.isTablet ? 3.5.h : 2.h,
                ),
              )
            : null,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(
          color: textColor,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        ),
        labelText: label,
        filled: true,
        fillColor: AppColors.editTextFillColor,
      ),
      value: dropdownValue,
      onChanged: onChanged,
      hint: RichText(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: AppColors.hintColor,
            fontFamily: fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
          ),
        ),
      ),
      menuMaxHeight: 500,
      items: dropdownList!
          .map(
            (itemName) => DropdownMenuItem(
              value: itemName,
              child: CustomText(
                text: itemName,
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          )
          .toList(),
    );
  }
}
