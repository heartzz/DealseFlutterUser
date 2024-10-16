import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../generated/assets.dart';
import 'app_colors.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    super.key,
    required this.controller,
    required this.itemCount,
    this.colorActive,
    this.colorInActive,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final Color? colorActive;
  final Color? colorInActive;

  static const double _mDotSize = 10.0;
  static const double _mMaxZoom = 1.3;
  static const double _mDotSpacing = 20.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeInBack.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_mMaxZoom - 1.0) * selectedness;

    if (zoom > 1) {
      return SizedBox(
        width: 25,
        child: Center(
          child: SvgPicture.asset(
            Assets.imagesIcTabIndicator,
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: _mDotSpacing,
        child: Center(
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) => RadialGradient(
              center: Alignment.topCenter,
              stops: const [.5, 1],
              colors: [
                colorInActive ?? AppColors.indicatorGray,
                colorActive ?? AppColors.primaryColor
              ],
            ).createShader(bounds),
            child: const Icon(
              Icons.circle,
              size: _mDotSize,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
