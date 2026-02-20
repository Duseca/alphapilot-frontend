import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/client_module/request_service/approved.dart';
import 'package:alpha_pilot/view/screens/client_module/request_service/confirm_request.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/trans_container.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_rx/get_rx.dart';

class UploadPicProof extends StatelessWidget {
  final String? path, title;
  final bool? ischeck;
  const UploadPicProof({
    super.key,
    this.path,
    this.title,
    this.ischeck = false,
  });

  @override
  Widget build(BuildContext context) {
    RxBool isfaled = false.obs;
    return Obx(
      () => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (ischeck == false)
              MyText(
                paddingTop: 50,
                paddingLeft: 20,
                size: 18,
                paddingRight: 20,
                text:
                    'Here are the cleaning details for the griddle. Tap to zoom.',
              ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 0),
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: ischeck == true ? 100 : 50),
                  if (ischeck == true)
                    Center(
                      child: IconTextRow(
                        iconpath: Assets.imagesPeople,
                        text: 'Team 1',
                        padends: 10,
                        padvertical: 5,
                        textsize: 16,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        expanded: F,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decoration: rounded2(kBlackColor, kBlackColor),
                        textcolor: kOrangeColor,
                      ),
                    ),
                  SizedBox(height: 10),
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
                      decoration: roundedsr(
                        color: kQuaternaryColor,
                        radius: 100,
                      ),
                      text: title ?? 'Griddle',
                      textsize: 22,
                      iconcolor: kBlackColor,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),

                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 30,
                          ),
                          height: 240,
                          decoration: roundedsr(
                            borderwidth: 3,

                            color2: isfaled.value == true
                                ? kRedEmber
                                : kMintGreen,
                            radius: 24,
                            color: kQuaternaryColor,
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: -20,
                          child: Bounce(
                            onTap: () {
                              isfaled.value = true;
                            },
                            child: Container(
                              decoration: roundedsr(
                                color2: ktransparent,
                                color: ktransparent,
                                radius: 400,
                              ),
                              child: CommonImageView(
                                imagePath: isfaled.value == true
                                    ? Assets.imagesClose2
                                    : Assets.imagesTick3,
                                height: 79,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 40,
                          color: isfaled.value == true ? kRedColor : kMintGreen,
                        ),
                        left: BorderSide(
                          width: 40,
                          color: isfaled.value == true ? kRedColor : kMintGreen,
                        ),
                      ),
                    ),
                    child: Center(
                      child: MyText(
                        textAlign: TextAlign.center,
                        lineHeight: 1,
                        text: isfaled.value == true
                            ? 'Dirty griddle:\n.......................................'
                            : 'Cleaning meets standards',
                        size: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      spacing: 20,
                      children: [
                        if (ischeck == false)
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
                            gradient: isfaled.value == true
                                ? gradred
                                : gradgreen,
                            onTap: () {
                              if (ischeck == true)
                                Get.to(() => ConfirmRequest(isagent: true));
                            },
                            text: isfaled.value == true
                                ? 'Restart'
                                : 'Continue',
                            fontSize: 22,
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
      ),
    );
  }
}
