import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomGradientButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double width;
  final double radius;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final Color gradient0;
  final Color gradient1;
  final GestureTapCallback onPressed;

  const CustomGradientButton(
      {super.key,
      required this.onPressed,
      required this.buttonColor,
      required this.buttonText,
      required this.width,
      required this.height,
      this.radius = 50,
      this.fontSize = 18,
      required this.fontFamily,
      required this.gradient0,
      required this.gradient1,
      this.fontWeight = FontWeight.normal,
      this.textColor = AppColors.white,
      this.borderColor = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradient0, gradient1],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.4, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.repeated),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Container(
            width: double.infinity,
            height: height,
            alignment: Alignment.center,
            child: CustomText(
              text: buttonText,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
