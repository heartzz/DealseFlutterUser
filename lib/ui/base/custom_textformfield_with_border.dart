import 'package:dealse/utils/extension_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';


class CustomTextFormFieldWithBorder extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final int maxline;
  final String? hintText;
  final String? title;
  final TextStyle hintStyle;
  final IconButton? suffixIcon;
  final Padding? prefixIcon;
  final FocusNode? focusNode;
  final double borderRadius;
  final bool isRequired;
  final bool isEnabled;
  final double fontSize;
  final FontWeight fontWeight;
  final BorderSide borderSide;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final InputBorder focusedBorder;
  final InputBorder enabledBorder;

  final EdgeInsetsGeometry contentPadding;
  final Color textColor;
  final FontWeight textFontWeight;

  const CustomTextFormFieldWithBorder({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.textColor=AppColors.primaryColor,
    this.textFontWeight=FontWeight.w400,
    this.title,
    this.textAlign = TextAlign.left,
    this.maxline = 1,
    this.hintText,
    this.hintStyle = const TextStyle(
      color: AppColors.hintColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.suffixIcon,
    this.borderRadius = 10,
    this.contentPadding = const EdgeInsets.all(16),
    this.borderSide = const BorderSide(color: AppColors.primaryColor, width: 1),
    this.focusedBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    this.isRequired = false,
    this.isEnabled = true,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.enabledBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    this.maxLength,
    this.inputFormatters,
    this.prefixIcon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null)
        CustomText(
          text: title ?? '',
        ),
        if(title != null)
        5.sbh,
        TextFormField(
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          maxLength: maxLength,
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: AppColors.primaryColor,
          style:  TextStyle(color: textColor,fontWeight: fontWeight),
          textAlign: textAlign,
          maxLines: maxline,
          readOnly: !isEnabled,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              counterText: '',
              enabledBorder: enabledBorder,
              hintText: hintText,
              hintStyle: hintStyle,
              suffixIcon: suffixIcon != null
                  ? IconTheme(
                      data: const IconThemeData(color: AppColors.black),
                      child: suffixIcon!,
                    )
                  : null,
              contentPadding: contentPadding,
              border: UnderlineInputBorder(
                borderSide: borderSide,
              ),
              focusedBorder: focusedBorder,
              disabledBorder: focusedBorder),
        ),
      ],
    );
  }
}
