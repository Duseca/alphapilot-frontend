import 'dart:ui';

import 'package:alpha_pilot/view/widgets/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widgets/simple_app_bar.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widgets/moving_icon.dart';
import 'package:alpha_pilot/view/widgets/my_button.dart';
import 'package:alpha_pilot/view/widgets/my_text_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,

    this.path,

    this.title,
    this.title2,
    this.subtitle,

    // Button Texts
    this.btnText1 = '',
    this.btnText2 = '',
    this.btnText3 = '',
    this.btnText4 = '',

    // Button Colors
    this.btnColor1,
    this.btnColor2,
    this.btnColor3,
    this.btnColor4,

    // Font Colors
    this.fontColor1,
    this.fontColor2,
    this.fontColor3,
    this.fontColor4,

    // Button actions
    this.btn1OnTap,
    this.btn2OnTap,
    this.btn3OnTap,
    this.btn4OnTap,
    this.btn1outlineColor,
    this.btn2outlineColor,
    this.btntextColor1,
    // Layout Control
    this.showRowButtons = F,
    this.showColumnButtons = false,
    this.iconheight,
  });

  final String? path, title, title2, subtitle;

  // Button texts
  final String? btnText1, btnText2, btnText3, btnText4;

  // Button colors
  final Color? btnColor1,
      btnColor2,
      btnColor3,
      btnColor4,
      btn1outlineColor,
      btn2outlineColor,
      btntextColor1;

  // Font colors
  final Color? fontColor1, fontColor2, fontColor3, fontColor4;

  // Button onTap handlers
  final VoidCallback? btn1OnTap;
  final VoidCallback? btn2OnTap;
  final VoidCallback? btn3OnTap;
  final VoidCallback? btn4OnTap;

  // Layout toggles
  final bool showRowButtons;
  final bool showColumnButtons;
  final double? iconheight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 0.0, sigmaX: 0),
                child: Container(color: Colors.black.withOpacity(0.02)),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 50,
                    ),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kSecondaryColor2,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ktransparent),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        MovingIcon(
                          path: path ?? Assets.imagesLogo,
                          height: iconheight ?? 129,
                        ),

                        MyText(
                          text: title ?? "Delete Account",
                          weight: wmedium,
                          paddingTop: 10,
                          size: 26,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),

                        MyText(
                          text: subtitle ?? "",
                          textAlign: TextAlign.center,
                          paddingBottom: 20,
                          weight: wregular,
                          size: 18,
                          color: ksubtextColor,
                        ),

                        /// -----------------------------------
                        /// 🔵 ROW BUTTONS (Button 1, Button 2)
                        /// -----------------------------------
                        if (showRowButtons)
                          Row(
                            children: [
                              Expanded(
                                child: MyButton.filled(
                                  fontWeight: wregular,
                                  mBottom: 10,
                                  borderRadius: 16,
                                  onTap: btn1OnTap ?? () => Get.back(),
                                  buttonText: btnText1 ?? "Cancel",
                                  backgroundColor:
                                      btnColor1 ?? Colors.transparent,
                                  outlineColor: btn1outlineColor ?? kGreyColor,
                                  fontColor: fontColor1 ?? kGreyColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: MyButton.filled(
                                  fontWeight: wregular,
                                  mBottom: 10,
                                  borderRadius: 16,
                                  onTap: btn2OnTap ?? () {},
                                  buttonText: btnText2 ?? "Delete",
                                  backgroundColor: btnColor2 ?? kRedColor,
                                  fontColor: fontColor2 ?? kQuaternaryColor,
                                ),
                              ),
                            ],
                          ),

                        if (showColumnButtons == F)
                          MyButton.filled(
                            // borderRadius: 16,
                            fontWeight: wregular,
                            onTap: btn1OnTap ?? () {},
                            mBottom: 10,
                            buttonText: btnText1!,
                            outlineColor: kSecondaryColor,
                            backgroundColor: btnColor1 ?? kSecondaryColor,
                            fontColor: fontColor1 ?? kQuaternaryColor,
                          ),

                        /// -----------------------------------
                        /// 🔵 COLUMN BUTTONS (Button 3, Button 4)
                        /// -----------------------------------
                        if (showColumnButtons)
                          Column(
                            children: [
                              if (btnText3 != null)
                                MyButton.filled(
                                  //  borderRadius: 16,
                                  mBottom: 10,
                                  fontWeight: wregular,
                                  onTap: btn3OnTap ?? () {},
                                  outlineColor: kSecondaryColor,
                                  buttonText: btnText3!,
                                  backgroundColor: btnColor3 ?? kSecondaryColor,
                                  fontColor: fontColor3 ?? kPrimaryColor,
                                ),
                              //   if (btnText4 != null) const SizedBox(height: 10),
                              if (btnText4 != null)
                                MyButton.filled(
                                  fontWeight: wregular,
                                  //  borderRadius: 16,
                                  onTap: btn4OnTap ?? () {},
                                  outlineColor: ktransparent,
                                  buttonText: btnText4!,
                                  backgroundColor: btnColor4 ?? kSecondaryColor,
                                  fontColor: fontColor4 ?? kPrimaryColor,
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogLayout extends StatelessWidget {
  const DialogLayout({
    super.key,
    this.padends,
    this.mhoriz,
    this.children,
    this.title,
    this.leftpad,
  });
  final String? title;
  final double? padends, mhoriz, leftpad;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                child: Container(
                  color: ktransparent, // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padends ?? 16,
                          vertical: 60,
                        ),
                        margin: EdgeInsets.fromLTRB(
                          mhoriz ?? 20,
                          5,
                          mhoriz ?? 20,
                          30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kSecondaryColor2,
                          border: Border.all(color: ktransparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: children ?? [],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: leftpad ?? 16,
                        left: leftpad ?? 16,
                        child: simpleAppBar(
                          centerTitle: true,
                          title: title,
                          bgColor: ktransparent,
                          height: 30,
                          titleColor: kQuaternaryColor,
                          haveBackButton: false,
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: CommonImageView(
                                imagePath: Assets.imagesClose,
                                height: 24,
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
