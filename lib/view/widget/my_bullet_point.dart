import 'package:flutter/material.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class MyBullet extends StatelessWidget {
  MyBullet({super.key, this.point, this.size, this.color, this.bullet});
  String? point, bullet;
  Color? color;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: bullet ?? '•',
            color: color ?? ksubtextColor,
            size: 20,
            //paddingLeft: 25,
            paddingRight: 5,
          ),
          Expanded(
            child: MyText(
              text: point ?? '',
              color: color ?? ksubtextColor,
              size: size ?? 20,
            ),
          ),
          //  SizedBox(width: 10),
        ],
      ),
    );
  }
}
