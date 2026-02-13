import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_fonts.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyGradientText extends StatelessWidget {
  MyGradientText({Key? key, required this.text, required this.size})
    : super(key: key);
  String text;
  double size;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return appgrad.createShader(bounds);
      },
      child: MyText(
        text: '$text',
        size: size,
        fontFamily: SFPRO,
        weight: wblack,
        color: kQuaternaryColor,
      ),
    );
  }
}
