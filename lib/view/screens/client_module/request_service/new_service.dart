import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/view/screens/birgade_module/sos_details.dart';
import 'package:alpha_pilot/view/screens/client_module/request_service/confirm_request.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class NewService extends StatelessWidget {
  const NewService({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<int> selectedActions = <int>[].obs;
    return Scaffold(
      body: Column(
        children: [
          TwoTextedColumn(
            text1: 'New service',
            text2:
                'Enter your location details. Clic on items you want to be cleaned.',
            size1: 26,
            size2: 18,
            padEnds: 20,
            padVertical: 40,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(14),
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          MyText(text: 'Site address', size: 18),
                          Expanded(
                            child: TransparentContainer(
                              text: 'Street XX',
                              align: TextAlign.end,
                              opacity: 1,
                              textSize: 17,
                              color1: kGreyColor.withOpacity(0.2),
                              textColor: kBlueColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Mobil-home/zone ID (automatic)',
                              size: 18,
                            ),
                          ),
                          Expanded(
                            child: TransparentContainer(
                              text: '[BC-001]',
                              align: TextAlign.end,
                              opacity: 1,
                              textSize: 17,
                              color1: kGreyColor.withOpacity(0.2),
                              textColor: kBlueColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: MyText(text: 'Date and time', size: 18),
                          ),
                          TransparentContainer(
                            text: '03 June 2026',

                            // align: TextAlign.end,
                            opacity: 1,
                            textSize: 17,
                            color1: Color(0xffC6D9FB),
                            padends: 10,
                            padvertical: 5,
                            textColor: kBlueColor,
                          ),
                          TransparentContainer(
                            text: '09:41',
                            // align: TextAlign.end,
                            opacity: 1,
                            padends: 10,
                            padvertical: 5,
                            textSize: 17,
                            color1: Color(0xffC6D9FB),
                            textColor: kBlueColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                MissionsWrap(
                  head: SizedBox(),
                  selectedIndices: selectedActions,
                  isResolved: false.obs,
                  padends: 0,
                  isnewservice: true,
                  onActionTap: (index) => {
                    if (selectedActions.contains(index))
                      {selectedActions.remove(index)}
                    else
                      {selectedActions.add(index)},
                  },
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GradientButton(
                    text: 'CONFIRM REQUEST',
                    onTap: () {
                      Get.to(() => ConfirmRequest());
                    },
                    fontSize: 17,
                    gradient: gradgreen,
                    borderWidth: 1,
                    borderColor: kGreyColor,
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
