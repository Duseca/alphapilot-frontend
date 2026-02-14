import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Gradient? gradient;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final double borderRadius;
  final Color borderColor;
  final bool? hasgrad, hasshadow;
  final Color? color, fontcolor;
  final double borderWidth;
  final Widget? child;
  const GradientButton({
    super.key,
    this.text,
    this.gradient,
    this.onTap,
    this.color,
    this.hasgrad = true,
    this.fontSize = 26,
    this.fontWeight = FontWeight.w500,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 100,
    this.borderColor = kQuaternaryColor,
    this.borderWidth = 3,
    this.child,
    this.hasshadow = true,
    this.fontcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: hasgrad == true
            ? BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: borderColor, width: borderWidth),
                boxShadow: hasshadow == true
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: -1.7,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 20,
                        ),
                      ]
                    : [],
              )
            : BoxDecoration(
                color: color ?? kQuaternaryColor,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: borderColor, width: borderWidth),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: -1.7,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                  ),
                ],
              ),
        child:
            child ??
            Center(
              child: MyText(
                text: text ?? '',
                size: fontSize ?? 26,
                weight: fontWeight ?? wmedium,
                color: fontcolor ?? kQuaternaryColor,
              ),
            ),
      ),
    );
  }
}
