import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/controller/pin_login_controller.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/custom_keypad.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/two_text_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PinLogin extends StatelessWidget {
  const PinLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final controller = Get.put(PinLoginController());

    return Scaffold(
      //appBar: simpleAppBar(title: ''),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 30),
                Center(
                  child: CommonImageView(
                    imagePath: Assets.imagesLogo,
                    height: 88,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20,
                  ),
                  child: GradientButton(
                    hasshadow: F,
                    text: 'FLYING SQUAD',
                    gradient: gradred,
                  ),
                ),

                MyText(
                  text: 'Enter the PIN code',
                  size: 18,
                  color: kGreyColor,
                  textAlign: TextAlign.center,
                ),
                _PinIndicators(controller: controller),
                const SizedBox(height: 60),
                CustomKeypad(
                  onKeyTap: controller.addDigit,
                  onBackspace: controller.removeDigit,
                  onFingerprint: controller.handleFingerprint,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget for PIN indicators - only this rebuilds when PIN changes
class _PinIndicators extends StatelessWidget {
  final PinLoginController controller;

  const _PinIndicators({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pinLength = controller.pin.value.length;

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          bool isEntered = index < pinLength;
          bool isCurrent = index == pinLength;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isEntered || isCurrent ? kRedColor : Color(0xffC9C9C9),
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      );
    });
  }
}
