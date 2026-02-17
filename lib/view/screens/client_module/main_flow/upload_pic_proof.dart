import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';

class UploadPicProof extends StatelessWidget {
  final String? path, title;
  const UploadPicProof({super.key, this.path, this.title});

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
              padding: EdgeInsets.symmetric(horizontal: 0),
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
                SizedBox(height: 20),
                Center(
                  child: IconTextRow(
                    expanded: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    iconpath: path ?? Assets.imagesGriddel,
                    iconsize: 31,
                    padends: 10,
                    padvertical: 5,
                    textcolor: kBlackColor,
                    decoration: roundedsr(color: kQuaternaryColor, radius: 100),
                    text: title ?? 'Griddle',
                    textsize: 22,
                    iconcolor: kBlackColor,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  height: 240,
                  decoration: roundedsr(
                    borderwidth: 3,

                    color2: kMintGreen,
                    radius: 24,
                    color: kQuaternaryColor,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 40, color: kMintGreen),
                      left: BorderSide(width: 40, color: kMintGreen),
                    ),
                  ),
                  child: Center(
                    child: MyText(text: 'Cleaning meets standards', size: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: GradientButton(
                          borderColor: ktransparent,
                          gradient: gradred,
                          onTap: () {},
                          text: 'Claim',
                          fontSize: 16,
                          borderWidth: 0,
                        ),
                      ),
                      Expanded(
                        child: GradientButton(
                          borderColor: ktransparent,
                          gradient: gradgreen,
                          onTap: () {},
                          text: 'Continue',
                          fontSize: 16,
                          borderWidth: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
