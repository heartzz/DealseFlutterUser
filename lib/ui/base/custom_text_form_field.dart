import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final int lineCount;
  final int maxLength;
  final String fontFamily;
  final String prefixIcon;
  final String suffixIcon;
  final double fontSize;
  final bool isRequired;
  final bool isReadOnly;
  final bool isEnabled;
  final bool isPassword;
  final bool isPreFixIcon;
  final bool isSufixIcon;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final TextCapitalization capitalization;
  final Color textColor;
  final Color hintTextColor;
  final Function? onChanged;

  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.textEditingController,
      this.focusNode,
      this.nextFocus,
      this.lineCount = 1,
      this.maxLength = 60,
      required this.fontFamily,
      required this.fontSize,
      this.capitalization = TextCapitalization.none,
      this.isRequired = false,
      this.isReadOnly = false,
      this.isEnabled = true,
      this.isPassword = false,
      this.isPreFixIcon = false,
      this.isSufixIcon = false,
      this.onChanged,
      this.prefixIcon = Assets.imagesIcArrowLeft,
      this.suffixIcon = Assets.imagesIcSearch,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.textColor = AppColors.black,
      this.hintTextColor = AppColors.hintColor});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.lineCount,
      maxLines: widget.lineCount,
      maxLength: widget.maxLength,
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      style: TextStyle(
        color: widget.textColor,
        fontFamily: widget.fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: widget.fontSize,
      ),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).primaryColor,
      textCapitalization: widget.capitalization,
      readOnly: widget.isReadOnly,
      enabled: widget.isEnabled,
      autofocus: false,
      inputFormatters: const [],
      textAlign: TextAlign.left,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: TextStyle(
          color: widget.hintTextColor,
          fontFamily: widget.fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: widget.fontSize,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: widget.isPreFixIcon == false
            ? EdgeInsets.only(
                right: 1.h, bottom: 1.7.h, top: 1.7.h, left: 1.7.h)
            : EdgeInsets.zero,
        filled: true,
        counterText: "",
        fillColor: widget.isEnabled
            ? AppColors.editTextFillColor
            : AppColors.editTextFillColor,
        prefixIcon: widget.isPreFixIcon
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: SvgPicture.asset(
                  widget.prefixIcon,
                  width: 2.5.w,
                  height: 2.5.h,
                ),
              )
            : null,
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.all(2.h),
                child: GestureDetector(
                  onTap: () {
                    if (widget.textEditingController?.text.isNotEmpty == true) {
                      _toggle();
                    }
                  },
                  child: SvgPicture.asset(
                    _obscureText
                        ? Assets.imagesIcEyeHide
                        : Assets.imagesIcEyeShow,
                    width: 2.5.w,
                    height: 2.5.h,
                  ),
                ),
              )
            : widget.isSufixIcon
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 1.5.h, vertical: 1.5.h),
                    child: SvgPicture.asset(
                      widget.suffixIcon,
                      width: 2.w,
                      height: 2.h,
                    ),
                  )
                : null,
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
      ),
      onChanged: widget.onChanged as void Function(String)?,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
