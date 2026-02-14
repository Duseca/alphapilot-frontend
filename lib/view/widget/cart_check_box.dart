import 'package:alpha_pilot/const/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    super.key,
    required this.isActive,
    required this.onTap,
    this.unSelectedColor,
    this.selectedColor,
    this.size,
    this.circleIcon,
    this.iconColor,
    this.radius,
    this.borderColor,
    this.bordercolor2,
    this.circleIconsize,
    this.iscircle,
  });
  final bool isActive;
  final VoidCallback onTap;
  Gradient? unSelectedColor, selectedColor;
  Color? iconColor, borderColor, bordercolor2;
  bool? iscircle;
  final double? size, radius, circleIconsize;
  final IconData? circleIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 230),
        curve: Curves.easeInOut,
        height: size ?? 20,
        width: size ?? 20,
        decoration: BoxDecoration(
          gradient: isActive
              ? selectedColor ?? appgrad
              : unSelectedColor ??
                    LinearGradient(colors: [ktransparent, ktransparent]),
          border: Border.all(
            width: 2,
            color: isActive
                ? bordercolor2 ?? kSecondaryColor
                : borderColor ?? kQuaternaryColor,
          ),
          borderRadius: BorderRadius.circular(
            iscircle == true ? 50 : radius ?? 5,
          ),
        ),
        child: !isActive
            ? Icon(circleIcon, size: 10, color: kQuaternaryColor)
            : Icon(
                iscircle == true ? circleIcon ?? Icons.check : Icons.check,
                size: circleIconsize ?? 15,
                color: isActive == true
                    ? iconColor ?? kQuaternaryColor
                    : ktransparent,
              ),
      ),
    );
  }
}
