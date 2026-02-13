import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alpha_pilot/const/app_colors.dart';

class TwoTextedColumn extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  final FontWeight? weight1;
  final FontWeight? weight2;
  final double? size1, padEnds, padVertical, space;
  final double? size2;
  final ColumnAlignment alignment;
  final TextAlign? textAlign;
  const TwoTextedColumn({
    super.key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
    this.weight1,
    this.weight2,
    this.space,
    this.size1,
    this.size2,
    this.alignment = ColumnAlignment.start,
    this.padEnds,
    this.padVertical,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    // Map alignment choice to CrossAxisAlignment
    final crossAxisAlignment = {
      ColumnAlignment.start: CrossAxisAlignment.start,
      ColumnAlignment.end: CrossAxisAlignment.end,
      ColumnAlignment.center: CrossAxisAlignment.center,
    }[alignment]!; // Use ! to ensure a non-null value
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padEnds ?? 0,
        vertical: padVertical ?? 0,
      ),
      child: Column(
        spacing: space ?? 0,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Animate(
            effects: [
              MoveEffect(
                delay: Duration(milliseconds: 200),
                begin: Offset(10, 0),
              ),
            ],
            child: MyText(
              text: text1,
              size: size1 ?? 26,
              textAlign: textAlign,
              color: color1 ?? kTertiaryColor,
              weight: weight1 ?? FontWeight.w800,
              paddingBottom: space ?? 0,
            ),
          ),
          Animate(
            effects: [MoveEffect()],
            child: MyText(
              text: text2,

              size: size2 ?? 16,
              color: color2 ?? kTertiaryColor,
              weight: weight2 ?? FontWeight.w400,

              //     maxLines: 2,
              textAlign: textAlign,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

enum ColumnAlignment { start, end, center }

class ExpandedRow extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  final FontWeight? weight1;
  final FontWeight? weight2;
  final double? size1;
  final bool? isExpanded;
  final double? size2;
  final VoidCallback? ontap1, ontap2;
  final TextDecoration? decoration1, decoration2;
  const ExpandedRow({
    super.key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
    this.weight1,
    this.weight2,
    this.size1,
    this.size2,
    this.ontap2,
    this.ontap1,
    this.decoration1,
    this.decoration2,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded == true
        ? Row(
            children: [
              Expanded(
                flex: 4,
                child: MyText(
                  text: text1, //'\$39.69',
                  size: size1 ?? 12.5,
                  color: color1 ?? kBlackColor,
                  weight: weight1 ?? FontWeight.w500,
                  onTap: ontap1,
                  decoration: decoration1 ?? TextDecoration.none,
                ),
              ),
              Expanded(
                child: MyText(
                  text: text2, //'Free Now Booking Fee',
                  size: size2 ?? 12.5,
                  color: color2 ?? kBlackColor,
                  weight: weight2 ?? FontWeight.w500,
                  onTap: ontap2,
                  decoration: decoration2 ?? TextDecoration.none,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: text1, //'\$39.69',
                size: size1 ?? 12.5,
                color: color1 ?? kBlackColor,
                weight: weight1 ?? FontWeight.w500,
                onTap: ontap1,
                decoration: decoration1 ?? TextDecoration.none,
              ),
              MyText(
                text: text2, //'Free Now Booking Fee',
                size: size2 ?? 12.5,
                color: color2 ?? kBlackColor,
                weight: weight2 ?? FontWeight.w500,
                onTap: ontap2,
                decoration: decoration2 ?? TextDecoration.none,
              ),
            ],
          );
  }
}
