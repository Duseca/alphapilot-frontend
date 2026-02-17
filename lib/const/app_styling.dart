import 'package:alpha_pilot/const/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration circle(
  Color color,
  Color? borderColor, {
  double width = 1,
  bool hasshadow = false,
}) {
  return BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: hasshadow == true
        ? [
            BoxShadow(
              color: Color(0xff12110D).withOpacity(0.17),
              offset: Offset(0, 4),
              blurRadius: 40,
            ),
          ]
        : null,
    color: color,
    border: Border.all(color: borderColor ?? Colors.transparent, width: width),
  );
}

BoxDecoration rounded(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: color,
    boxShadow: [
      BoxShadow(
        color: kTertiaryColor,
        blurRadius: 10,
        offset: Offset(2, 2), // Shadow position
      ),
    ],
  );
}

BoxDecoration roundedsr({
  Color? color,
  double? radius,
  Color? color2,
  double? borderwidth,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius ?? 10),
    color: color ?? kPrimaryColor,
    border: Border.all(color: color2 ?? kPrimaryColor, width: borderwidth ?? 1),
    boxShadow: [
      BoxShadow(
        color: kBlackColor.withOpacity(0.1),
        blurRadius: 34,
        offset: Offset(0, 4), // Shadow position
      ),
      BoxShadow(
        color: kBlackColor.withOpacity(0.2),
        blurRadius: 7.7,
        offset: Offset(0, 4), // Shadow position
      ),
    ],
  );
}

BoxDecoration graddecor({double? radius, Color? color2, Gradient? gradient}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius ?? 10),
    gradient: gradient,
    border: Border.all(color: color2 ?? ktransparent),
    boxShadow: [
      BoxShadow(
        color: kBlackColor.withOpacity(0.1),
        blurRadius: 34,
        offset: Offset(0, 4), // Shadow position
      ),
      BoxShadow(
        color: kBlackColor.withOpacity(0.2),
        blurRadius: 7.7,
        offset: Offset(0, 4), // Shadow position
      ),
    ],
  );
}

// BoxDecoration bluegreydecor() {
//   return rounded2(
//     ThemeUtils.isDarkMode(Get.context!) ? kSecondaryColor : Color(0xffF2F2F7),
//     ThemeUtils.isDarkMode(Get.context!) ? kSecondaryColor : Color(0xffF2F2F7),
//   );
// }

class KTertiaryColor {}

BoxDecoration rounded2(Color color, Color? borderColor, {double width = 1}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: color,
    border: Border.all(color: borderColor ?? Colors.transparent, width: width),
  );
}

// BoxDecoration graddecor() {
//   return BoxDecoration(
//     borderRadius: BorderRadius.circular(100),
//     border: const GradientBoxBorder(gradient: aapgrad, width: 1),
//   );
// }

BoxDecoration rounded2r(Color color, Color? borderColor, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
    border: Border.all(color: borderColor ?? Colors.transparent),
  );
}

BoxDecoration roundedr(Color color, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  );
}
