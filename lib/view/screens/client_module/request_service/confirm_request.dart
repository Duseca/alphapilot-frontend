import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/screens/client_module/request_service/approved.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/countdown_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ConfirmRequest extends StatelessWidget {
  const ConfirmRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<int> selectedActions = <int>[0, 1, 2, 3, 4].obs;
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'The cleaning team has finished.',
            paddingLeft: 20,
            size: 18,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 60),
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
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: graddecor(gradient: gradred, radius: 100),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesClock2,
                          height: 38,
                        ),
                        CountdownScreen(),
                      ],
                    ),
                  ),
                ),
                MissionsWrap(
                  status: 'Completed',
                  icon: Assets.imagesTick2,
                  selectedIndices: selectedActions,
                  isResolved: T.obs,
                  padends: 13,
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
                    color1: kBlackColor,
                    padends: 20,
                    radius: 100,
                    padvertical: 0,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GradientButton(
                    text: 'Validate the cleaning',
                    onTap: () => Get.to(() => Approved()),
                    fontSize: 22,
                    gradient: gradgreen,
                    borderWidth: 1,
                    borderColor: kGreyColor,
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
