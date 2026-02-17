import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';

class TransparentContainer extends StatelessWidget {
  final Color? color1; // First color (nullable)
  final Color? color2; // Second color (nullable)
  final double? opacity; // Opacity (nullable)
  final String? text; // Nullable text
  final double? textSize, padends, padvertical, radius; // Nullable text size
  final Color? textColor; // Nullable text color
  final FontWeight? textWeight;
  final FontStyle? fontStyle;
  final TextAlign? align; // Nullable text weight

  const TransparentContainer({
    super.key,
    this.color1,
    this.color2,
    this.opacity,
    this.text,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.padends,
    this.padvertical,
    this.radius,
    this.fontStyle,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padends ?? 10,
        vertical: padvertical ?? 2,
      ),
      decoration: BoxDecoration(
        color: (color1 ?? ktransparent),
        borderRadius: BorderRadius.circular(radius ?? 15),
        border: Border.all(color: color2 ?? Colors.transparent),
        boxShadow: [
          BoxShadow(
            blurRadius: 60,
            offset: Offset(4, 6),
            color: kBlackColor.withOpacity(0.04),
          ),
        ],
      ),
      child: text != null
          ? MyText(
              text: text!,
              fontStyle: fontStyle,
              textAlign: align,
              size: textSize ?? 12, // Default size if null
              weight: textWeight ?? wregular, // Default weight if null
              color: textColor ?? kQuaternaryColor, // Default color if null
            )
          : null,
    );
  }
}
