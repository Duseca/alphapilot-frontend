import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
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
                MissionsWrap(padends: 0, isResolved: true.obs, itemextent: 57),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
