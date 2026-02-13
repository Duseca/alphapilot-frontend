// ignore_for_file: use_full_hex_values_for_flutter_colors, constant_identifier_names

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xffE2E2E2);
const kSecondaryColor = Color(0xff2B78B6);
const kSecondaryColor2 = Color(0xff1E293B);
const kTertiaryColor = Color(0xff181818);
Color ksubtextColor = Color(0xff94A3B8);
const kQuaternaryColor = Color(0xffFFFFFF);
const kGreyColor = Color(0xff6B7280);
const kGreyMedium = Color(0xff868686);
const kGreyLight = Color(0xffD6D3CD);
const kGreyColor1 = Color(0xffF4F4F4);
const kCharcoal = Color(0xff35332D);
const kYellowColor = Color(0xffF4D03F);
const kOrangeColor = Color(0xffFF6B00);
const kTealColor = Color(0xff00B3B3);
const kOffWhite = Color(0xffF7F7F7);
const kbgColor = Color(0xffFBFBFB);
const kRedEmber = Color(0xffE74C3C);
const kMintGreen = Color(0xff10B981);
const kErrorColor = Color(0xffFF0000);
const kBlueColor = Color(0xff2563EB);

const kBlackColor = Color(0xff000000);
const kRedColor = Color(0xffFF002E);
const ktransparent = Colors.transparent;

LinearGradient appgrad = LinearGradient(
  colors: [
    Color(0xff0F1E37), Color(0xff16305D),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradred = LinearGradient(
  colors: [
    Color(0xffEF4444), Color(0xffD93F3F),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradorange = LinearGradient(
  colors: [
    Color(0xffF5740B), Color(0xffF5780B),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient gradolive = LinearGradient(
  colors: [
    Color(0xffBCB142), Color(0xffAEAA3C),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradgreen = LinearGradient(
  colors: [
    Color(0xff10B981), Color(0xff11B57F),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient dbluegrad = LinearGradient(
  colors: [
    Color(0xff3A1D7E), Color(0xff4F0063),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient purplegrad = LinearGradient(
  colors: [
    Color(0xffAC4DFF), Color(0xff478BF9),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
LinearGradient bluegrad = LinearGradient(
  colors: [
    Color(0xff2563EB), Color(0xff2460E4),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient redtrans({Color? color2}) => LinearGradient(
  colors: [
    color2 ?? Color(0xffEF4444), const Color.fromARGB(0, 255, 255, 255),

    //  kPrimaryColor, // Start color

    // End color
  ],
  //stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
