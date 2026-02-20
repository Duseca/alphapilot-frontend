import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/screens/client_module/request_service/confirm_request.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Approved extends StatelessWidget {
  const Approved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  text: 'Cleaning approved!',
                  size: 36,
                  weight: wblack,
                  paddingTop: 80,
                ),
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
                SizedBox(height: 10),
                MissionsWrap(
                  headpadends: 20,
                  radius: 11,
                  wrapspacing: 4,
                  iconheight: 0,
                  padends: 10,
                  size: 29,
                  selectedIndices: selectedActions,
                  fontsize: 11,
                  isResolved: true.obs,
                  itemextent: 57,
                  mhoriz: 0,
                ),
                MyText(
                  text: 'Progress',
                  paddingTop: 20,
                  size: 20,
                  weight: wlight,
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: TransparentContainer(
                    text: '15 out of 15',
                    opacity: 1,
                    textSize: 20,
                    color1: kMintGreen,
                    padends: 20,
                    radius: 100,
                    padvertical: 0,
                  ),
                ),
                SizedBox(height: 40),
                TwoTextedColumn(
                  text1: 'The team is',
                  text2: 'Ahead by',
                  size1: 14,
                  size2: 18,
                  color1: kBlackColor,
                  color2: kMintGreen,
                  weight1: wregular,
                  alignment: ColumnAlignment.center,

                  weight2: wbold,
                ),
                Center(
                  child: TransparentContainer(
                    text: '+01:30',
                    opacity: 1,

                    textSize: 20,
                    color1: kMintGreen,
                    padends: 40,
                    radius: 100,
                    padvertical: 0,
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 040.0),
                  child: GradientButton(
                    text: 'Return to home',

                    gradient: appgrad,
                    padding: EdgeInsets.all(10),
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
