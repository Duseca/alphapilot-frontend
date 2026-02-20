import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/agent_module/photo_comparison.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/screens/client_module/request_service/confirm_request.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/countdown_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_field.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AgentMissionsDetails extends StatelessWidget {
  const AgentMissionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> fuelingactions = [
      {'label': 'Toilet Paper', 'icon': Assets.imagesToiletpaper},
      {'label': 'Champagne', 'icon': Assets.imagesChampagne},
      {'label': 'Welcome Kit', 'icon': Assets.imagesKit},
    ];
    final RxBool isactive = false.obs;
    final RxBool isSos = false.obs;
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 14),
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
                  itemextent: 89,
                  padends: 0,
                  selectedIndices: <int>[].obs,
                  isResolved: false.obs,
                  fontsize: 18,
                  iconsize: 49,
                  onActionTap: (index) => {
                    Get.to(() => PhotoComparison()),
                    if (selectedActions.contains(index))
                      {selectedActions.remove(index)}
                    else
                      {selectedActions.add(index)},
                  },
                ),
                MyText(
                  text: 'Points Validated',
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
                SizedBox(height: 40),
                Obx(
                  () => isactive.value == true || isSos.value == true
                      ? Column(
                          spacing: 10,
                          children: [
                            isSos.value == true
                                ? Center(
                                    child: IconTextRow(
                                      iconpath: Assets.imagesRefuel,
                                      text: 'Refueling',
                                      iconsize: 28,
                                      textsize: 15,
                                      ontap: () {
                                        isSos.value = F;
                                        isactive.value = true;
                                      },
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      textcolor: kQuaternaryColor,
                                      padvertical: 10,
                                      padends: 20,
                                      expanded: F,

                                      decoration: graddecor(
                                        gradient: gradolive,
                                        radius: 100,
                                      ),
                                    ),
                                  )
                                : MissionsWrap(
                                    padends: 0,
                                    iconheight: 49,
                                    itemextent: 89,
                                    selectedIndices: selectedActions,
                                    isResolved: false.obs,
                                    actions: fuelingactions,
                                    fontsize: 14,
                                    mhoriz: 10,
                                    wrapspacing: 10,
                                    onActionTap: (index) => {
                                      if (selectedActions.contains(index))
                                        {selectedActions.remove(index)}
                                      else
                                        {selectedActions.add(index)},
                                    },
                                    head: Center(
                                      child: IconTextRow(
                                        iconpath: Assets.imagesRefuel,
                                        text: 'Refueling',
                                        iconsize: 28,
                                        textsize: 15,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        textcolor: kQuaternaryColor,
                                        padvertical: 10,
                                        padends: 20,
                                        expanded: F,

                                        decoration: graddecor(
                                          gradient: gradolive,
                                          radius: 100,
                                        ),
                                      ),
                                    ),
                                  ),

                            isSos.value == true
                                ? Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: roundedsr(
                                      color2: kGreyColor.withOpacity(0.5),
                                      radius: 20,
                                    ),
                                    child: Column(
                                      spacing: 5,
                                      children: [
                                        IconTextRow(
                                          iconpath: Assets.imagesSos,
                                          text: 'SOS Brigade',
                                          iconsize: 28,
                                          padends: 20,
                                          textsize: 15,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          textcolor: kQuaternaryColor,
                                          padvertical: 10,

                                          expanded: F,
                                          decoration: graddecor(
                                            gradient: gradred,
                                            radius: 100,
                                          ),
                                        ),
                                        MyTextField(
                                          hintColor: kGreyColor,
                                          maxLines: 3,
                                          marginBottom: 0,
                                          hint:
                                              'Please write the points you need help with...',
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: GradientButton(
                                                text: 'Send',
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 10,
                                                ),
                                                fontSize: 16,
                                                borderColor: ktransparent,
                                                gradient: gradred,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : IconTextRow(
                                    iconpath: Assets.imagesSos,
                                    text: 'SOS Brigade',
                                    iconsize: 28,
                                    padends: 20,
                                    textsize: 15,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    textcolor: kQuaternaryColor,
                                    padvertical: 10,
                                    ontap: () => isSos.value = true,
                                    expanded: F,
                                    decoration: graddecor(
                                      gradient: gradred,
                                      radius: 100,
                                    ),
                                  ),
                          ],
                        )
                      : Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: IconTextRow(
                                iconpath: Assets.imagesRefuel,
                                text: 'Refueling',
                                iconsize: 28,
                                textsize: 15,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                textcolor: kQuaternaryColor,
                                padvertical: 10,
                                ontap: () => isactive.value = true,
                                expanded: F,
                                decoration: graddecor(
                                  gradient: gradolive,
                                  radius: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconTextRow(
                                iconpath: Assets.imagesSos,
                                text: 'SOS Brigade',
                                iconsize: 28,
                                textsize: 15,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                textcolor: kQuaternaryColor,
                                padvertical: 10,
                                ontap: () => isSos.value = true,
                                expanded: F,
                                decoration: graddecor(
                                  gradient: gradred,
                                  radius: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
