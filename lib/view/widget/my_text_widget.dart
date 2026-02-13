import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final FontWeight? weight;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontStyle? fontStyle;
  final VoidCallback? onTap;
  List<Shadow>? shadow;
  final int? maxLines;
  final double? size;
  final double? lineHeight;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? letterSpacing;

  MyText({
    super.key,
    required this.text,
    this.size,
    this.lineHeight,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing,
    this.weight = FontWeight.w500,
    this.textAlign,
    this.textOverflow,
    this.fontFamily,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.onTap,
    this.shadow,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect()],
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingTop!,
          left: paddingLeft!,
          right: paddingRight!,
          bottom: paddingBottom!,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text.tr,
            style: TextStyle(
              shadows: shadow,
              fontSize: size ?? 14,
              color: color ?? kBlackColor,
              fontWeight: weight,
              decoration: decoration,
              decorationColor: color,
              decorationThickness: 2,
              backgroundColor: ktransparent,
              fontFamily: fontFamily ?? SFPRO,
              height: lineHeight,
              fontStyle: fontStyle,
              letterSpacing: 0.5,
            ),
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: textOverflow,
          ),
        ),
      ),
    );
  }
}
