import 'package:flutter/material.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_fonts.dart';

import 'package:pinput/pinput.dart';

class MyPinCode extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final Color? color;

  const MyPinCode({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.color,
  });

  @override
  State<MyPinCode> createState() => _MyPinCodeState();
}

class _MyPinCodeState extends State<MyPinCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 80,
      height: 80,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      textStyle: TextStyle(
        fontSize: 21,
        color: widget.color ?? kQuaternaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: SFPRO,
      ),
      decoration: BoxDecoration(
        //  color: kGreyColor1,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffEFEFF4).withOpacity(0.4)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor),

        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Pinput(
      length: 4,
      autofillHints: ['---', '---', '---', '---'],
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: kSecondaryColor.withOpacity(0.3)),
          color: kSecondaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
