import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_styling.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/client_module/main_flow/upload_pic_proof.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class PhotoComparison extends StatelessWidget {
  const PhotoComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: appgrad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonImageView(imagePath: Assets.imagesBack, height: 45),
                  Center(
                    child: IconTextRow(
                      expanded: false,
                      mainAxisAlignment: MainAxisAlignment.center,
                      iconpath: Assets.imagesGriddel,
                      iconsize: 31,
                      padends: 10,
                      padvertical: 5,
                      textcolor: kBlackColor,
                      decoration: roundedsr(
                        color: kQuaternaryColor,
                        radius: 100,
                      ),
                      text: 'Griddle',
                      textsize: 22,
                      iconcolor: kBlackColor,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                  SizedBox(width: 45),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 0),
                physics: BouncingScrollPhysics(),
                children: [
                  MyText(
                    text: 'Reference photo',
                    color: Color(0xffF59E0B),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    height: 240,
                    decoration: roundedsr(
                      borderwidth: 3,

                      color2: Color(0xffF59E0B),
                      radius: 24,
                      color: kQuaternaryColor,
                    ),
                  ),
                  Container(
                    color: kQuaternaryColor,
                    child: Center(
                      child: MyText(
                        paddingTop: 5,
                        paddingBottom: 5,
                        text: 'Your Photo',
                        size: 18,
                        color: kBlackColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    height: 240,
                    decoration: roundedsr(
                      borderwidth: 3,

                      color2: kBlueColor,
                      radius: 24,
                      color: kQuaternaryColor,
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: roundedsr(color: ktransparent, color2: ktransparent),
            child: CommonImageView(imagePath: Assets.imagesFlash, height: 55),
          ),
          Bounce(
            onTap: () => Get.to(() => UploadPicProof(ischeck: true)),
            child: Container(
              decoration: roundedsr(
                color: ktransparent,
                color2: ktransparent,
                radius: 200,
              ),
              child: CommonImageView(imagePath: Assets.imagesCam, height: 95),
            ),
          ),
          SizedBox(width: 55),
        ],
      ),
    );
  }
}
