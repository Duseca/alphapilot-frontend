import 'dart:ui';

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'my_text_widget.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final Color? backgroundColor, fontColor;
  final Color outlineColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius, borderwidth;

  final String? svgPath;
  final String? imagePath;
  final IconData? iconData;
  final double iconSize;
  final Color? iconColor;
  final bool hasIcon, isdisable;
  final double mTop,
      mBottom,
      mhoriz,
      padtop,
      padbottom,
      padends,
      padright,
      space;
  final Gradient? gradient;

  final ButtonType _buttonType;

  const MyButton.outline({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.fontColor,
    this.height = 48,
    this.padtop = 0,
    this.padbottom = 0,
    this.isdisable = false,
    this.padends = 20,
    this.padright = 0,
    this.mBottom = 20,
    this.mhoriz = 0,
    this.space = 0,
    this.mTop = 0,
    this.width,
    this.outlineColor = kSecondaryColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 12,
    this.borderwidth = 1,
  }) : backgroundColor = ktransparent,
       gradient = null,
       svgPath = null,
       imagePath = null,
       iconData = null,
       iconSize = 20,
       iconColor = null,
       isRightIcon = F,
       hasIcon = false,
       _buttonType = ButtonType.outline;

  const MyButton.gradient({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.gradient,
    this.height = 48,
    this.fontColor = kSecondaryColor,
    this.padtop = 0,
    this.padbottom = 0,
    this.isdisable = false,
    this.padends = 20,
    this.padright = 0,
    this.mBottom = 20,
    this.mhoriz = 0,
    this.space = 0,
    this.mTop = 0,
    this.width,
    this.outlineColor = Colors.transparent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 12,
    this.borderwidth = 1,
  }) : backgroundColor = null,
       svgPath = null,
       imagePath = null,
       iconData = null,
       iconSize = 20,
       iconColor = null,
       isRightIcon = F,
       hasIcon = false,
       _buttonType = ButtonType.gradient;

  const MyButton.filled({
    super.key,
    required this.buttonText,
    this.fontColor,
    required this.onTap,
    this.backgroundColor,
    this.height = 48,
    this.padtop = 0,
    this.padbottom = 0,
    this.isdisable = false,
    this.padends = 20,
    this.padright = 0,
    this.mBottom = 20,
    this.mhoriz = 0,
    this.space = 0,
    this.mTop = 0,
    this.width,
    this.outlineColor = Colors.transparent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 12,
    this.borderwidth = 1,
  }) : gradient = null,
       svgPath = null,
       imagePath = null,
       iconData = null,
       iconColor = null,
       iconSize = 20,
       isRightIcon = F,
       hasIcon = false,
       _buttonType = ButtonType.filled;
  const MyButton.icon({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.svgPath,
    this.fontColor,
    this.imagePath,
    this.iconColor,
    this.iconData,
    this.backgroundColor,
    this.height = 48,
    this.padtop = 0,
    this.padbottom = 0,
    this.isdisable = false,
    this.padends = 20,
    this.padright = 0,
    this.mBottom = 20,
    this.mhoriz = 0,
    this.space = 8,

    this.mTop = 0,
    this.width,
    this.outlineColor = Colors.transparent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 12,
    this.borderwidth = 1,
    this.iconSize = 20,
    this.isRightIcon = false, // 👈 new flag added
  }) : gradient = null,
       hasIcon = true,
       _buttonType = ButtonType.icon;

  final bool isRightIcon; // 👈 new variable

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isdisable == false ? 1 : 0.5,
      child: Animate(
        effects: [
          ShimmerEffect(
            duration: 1000.ms,
            color: kQuaternaryColor.withOpacity(0.5),
            delay: 500.ms,
            angle: 0.5,
          ),
          FadeEffect(duration: Duration(milliseconds: 500)),
          MoveEffect(curve: Curves.fastLinearToSlowEaseIn),
        ],
        child: Bounce(
          scale: isdisable == false,
          duration: const Duration(milliseconds: 100),
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(
              top: mTop,
              bottom: mBottom,
              left: mhoriz,
              right: mhoriz,
            ),
            padding: EdgeInsets.only(
              top: padtop,
              bottom: padbottom,
              left: padends,
              right: padends,
            ),
            height: height,
            width: width,
            decoration: _getDecoration(),
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: isRightIcon
                      ? [
                          // 👈 icon on the right
                          MyText(
                            text: buttonText,
                            size: fontSize,
                            color: _getTextColor(),
                            weight: fontWeight,
                          ),
                          SizedBox(width: space),
                          _buildIcon(),
                        ]
                      : [
                          // 👈 icon on the left
                          _buildIcon(),
                          SizedBox(width: space),
                          MyText(
                            text: buttonText,
                            size: fontSize,
                            color: _getTextColor(),
                            weight: fontWeight,
                          ),
                        ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (svgPath != null) {
      // SVG Icon
      return SvgPicture.asset(svgPath!, height: iconSize, width: iconSize);
    } else if (imagePath != null) {
      return Image.asset(
        imagePath!,
        height: iconSize,
        width: iconSize,
        color: _getIconColor(),
      );
    } else if (iconData != null) {
      return Icon(iconData, size: iconSize, color: _getTextColor());
    }
    return const SizedBox.shrink();
  }

  Color? _getIconColor() {
    return iconColor; // 👈 use custom iconColor if provided
  }

  BoxDecoration _getDecoration() {
    switch (_buttonType) {
      case ButtonType.outline:
        return BoxDecoration(
          color: backgroundColor ?? kSecondaryColor,
          border: Border.all(color: outlineColor, width: borderwidth),
          borderRadius: BorderRadius.circular(borderRadius),
        );

      case ButtonType.gradient:
        return BoxDecoration(
          gradient: gradient,
          border: Border.all(color: outlineColor, width: borderwidth),
          borderRadius: BorderRadius.circular(borderRadius),
        );

      case ButtonType.filled:
      case ButtonType.icon:
        return BoxDecoration(
          color: backgroundColor ?? kSecondaryColor,
          border: Border.all(color: outlineColor, width: borderwidth),
          borderRadius: BorderRadius.circular(borderRadius),
        );
    }
  }

  Color _getTextColor() {
    switch (_buttonType) {
      case ButtonType.outline:
        return fontColor ?? outlineColor;
      case ButtonType.gradient:
        return fontColor ?? kQuaternaryColor;
      case ButtonType.filled:
      case ButtonType.icon:
        return fontColor ?? kQuaternaryColor;
        {}
    }
  }
}

enum ButtonType { outline, gradient, filled, icon }
