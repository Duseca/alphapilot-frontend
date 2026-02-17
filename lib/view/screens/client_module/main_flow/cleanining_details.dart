import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/screens/client_module/main_flow/upload_pic_proof.dart';

import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/countdown_widget.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CleaniningDetails extends StatelessWidget {
  const CleaniningDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<int> selectedActions = <int>[].obs;
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Cleaning details',
                  padEnds: 20,
                  text2:
                      'Click on each item to display photos of completed cleaning.',
                ),
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
                  selectedIndices: selectedActions,
                  isResolved: false.obs,

                  onActionTap: (index) => {
                    Get.to(
                      () => UploadPicProof(
                        path: defaultActions[index]['icon'],
                        title: defaultActions[index]['label'],
                      ),
                    ),
                    if (selectedActions.contains(index))
                      {selectedActions.remove(index)}
                    else
                      {selectedActions.add(index)},
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            MyText(
                              text: 'Validated Points',
                              size: 20,
                              weight: wlight,
                            ),
                            TransparentContainer(
                              text: '6 out of 15',
                              opacity: 1,
                              textSize: 20,
                              color1: kBlackColor,
                              padends: 20,
                              radius: 100,
                              padvertical: 0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1),
                          decoration: graddecor(gradient: gradred, radius: 20),
                          child: Column(
                            children: [
                              MyText(
                                text: 'Nb. of incidents',
                                size: 17,
                                color: kQuaternaryColor,
                              ),
                              MyText(
                                size: 20,
                                text: '1',
                                color: kQuaternaryColor,
                                weight: wbold,
                              ),
                            ],
                          ),
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
