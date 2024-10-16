import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double radius;
  final int? maxLine;
  final TextDecoration decoration;
  final Color decorationColor;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool isRequired;
  final double textSpacing;
  final FontStyle fontStyle;
  final bool? softWrap;
  final double? height;

  const CustomText( {
    super.key,
    required this.text,
    this.fontSize = 16,
    this.radius = 18,
    this.maxLine,
    this.color = AppColors.heading,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.left,
    this.textSpacing = 0.5,
    this.fontStyle = FontStyle.normal,
    this.softWrap,
    this.decoration = TextDecoration.none,
    this.decorationColor = AppColors.black,
    this.isRequired = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return isRequired
        ? Row(
      children: [
        Text(
          text,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          softWrap: softWrap,
          style: TextStyle(
              height: height ?? 1,
              decoration: decoration,
              decorationColor: color,
              fontSize: fontSize,
              // fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              color: color ?? AppColors.black),
        ),
        const Text(
          '*',
          style: TextStyle(color: AppColors.redHint),
        )
      ],
    )
        : Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,

      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
      style: TextStyle(

          height: height,
          decoration: decoration,
          decorationColor: color,
          fontSize: fontSize,
          // fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color ?? AppColors.black),
    );
  }
}
