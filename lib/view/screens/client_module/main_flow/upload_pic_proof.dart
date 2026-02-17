import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';

class UploadPicProof extends StatelessWidget {
  const UploadPicProof({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            paddingTop: 50,
            paddingLeft: 20,
            size: 18,
            paddingRight: 20,
            text: 'Here are the cleaning details for the griddle. Tap to zoom.',
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 50),
                Center(
                  child: TransparentContainer(
                    opacity: 1,
                    text: 'Team 1',
                    padends: 30,
                    color1: kQuaternaryColor,
                    color2: kGreyColor,
                    textColor: kGreyColor,
                  ),
                ),
                IconTextRow(
                  iconpath: Assets.imagesGriddel,
                  iconsize: 31,
                  textcolor: kBlackColor,
                  decoration: roundedsr(color: kQuaternaryColor),
                  text: 'Griddle',
                  textsize: 22,
                  iconcolor: kBlackColor,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
