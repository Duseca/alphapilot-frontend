import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/auth/pin_login.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/my_gradient_text.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 90),
                Center(
                  child: CommonImageView(
                    imagePath: Assets.imagesLogo,
                    height: 88,
                  ),
                ),
                SizedBox(height: 70),
                Center(
                  child: MyGradientText(text: 'Choose your role:', size: 22),
                ),
                SizedBox(height: 13),
                GradientButton(
                  text: 'AGENT PARTNER',
                  gradient: bluegrad,
                  onTap: () {},
                ),
                SizedBox(height: 13),
                GradientButton(
                  text: 'FLYING SQUAD',
                  gradient: gradred,
                  onTap: () {
                    Get.to(() => PinLogin());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: CommonImageView(
                      imagePath: Assets.imagesDivider,
                      height: 2,
                    ),
                  ),
                ),
                GradientButton(
                  text: 'CLIENT SPACE',
                  gradient: gradgreen,
                  onTap: () {},
                ),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: CommonImageView(
                      imagePath: Assets.imagesDivider,
                      height: 2,
                    ),
                  ),
                ),
                //  SizedBox(height: 20),
                GradientButton(
                  text: 'SUPER ADMIN',
                  gradient: dbluegrad,
                  onTap: () {},
                ),
                SizedBox(height: 13),
                GradientButton(
                  text: 'MANAGER',
                  gradient: purplegrad,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
