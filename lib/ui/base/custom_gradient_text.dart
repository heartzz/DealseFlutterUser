import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomGradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final int maxLine;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final double textSpacing;

  const CustomGradientText(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.maxLine = 1,
      this.textSpacing = 0.5,
      this.color = AppColors.black,
      this.textAlign = TextAlign.start,
      required this.fontFamily,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>  LinearGradient(
        colors: <Color>[color, color],
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
