import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/const/app_sizes.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/screens/client_module/main_flow/client_home.dart';
import 'package:alpha_pilot/view/widget/cart_check_box.dart';
import 'package:alpha_pilot/view/widget/common_image_view_widget.dart';
import 'package:alpha_pilot/view/widget/gradient_btn.dart';
import 'package:alpha_pilot/view/widget/icon_text_row.dart';
import 'package:alpha_pilot/view/widget/my_button.dart';
import 'package:alpha_pilot/view/widget/my_text_field.dart';
import 'package:alpha_pilot/view/widget/my_text_widget.dart';
import 'package:alpha_pilot/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              physics: BouncingScrollPhysics(),
              children: [
                Center(
                  child: CommonImageView(
                    imagePath: Assets.imagesLogo,
                    height: 88,
                  ),
                ),
                SizedBox(height: 10),
                GradientButton(text: 'CLIENT SPACE', gradient: gradgreen),
                MyText(
                  text: 'Welcome to Camping Le Soleil',
                  size: 26,
                  weight: wbold,
                  textAlign: TextAlign.center,
                  paddingLeft: 10,
                  paddingRight: 10,
                  paddingTop: 10,
                ),
                MyTextField(label: 'Email'),
                MyTextField(
                  label: 'Password',
                  labelsuffix: IconTextRow(
                    expanded: F,
                    text: 'Hide',
                    iconsize: 24,
                    textsize: 18,
                    padends: 0,
                    iconpath: Assets.imagesHide,
                    spacing: 10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: GradientButton(
                        text: '          Login          ',
                        fontSize: 16,
                        gradient: appgrad,
                        hasshadow: F,
                        borderColor: ktransparent,
                        padding: EdgeInsets.all(3),
                        borderRadius: 12,
                        onTap: () {
                          Get.to(() => ClientHome());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  spacing: 10,
                  children: [
                    CustomCheckBox(
                      isActive: true,
                      onTap: () {},

                      bordercolor2: ktransparent,
                    ),
                    MyText(text: "Remember Me", size: 16, color: kGreyColor),
                    Spacer(),
                    MyText(text: 'Need help?', size: 16, color: kGreyColor),
                  ],
                ),
                MyButton.icon(
                  buttonText: 'Continue with Apple',
                  onTap: () {},
                  imagePath: Assets.imagesApple,
                  borderRadius: 24,
                  fontWeight: wregular,
                  mTop: 20,
                  fontSize: 14,
                  outlineColor: kCharcoal,
                  fontColor: kBlackColor,
                  backgroundColor: kQuaternaryColor,
                ),
                MyButton.icon(
                  buttonText: 'Continue with Apple',
                  onTap: () {},
                  imagePath: Assets.imagesGoogle,
                  borderRadius: 24,
                  fontWeight: wregular,
                  fontSize: 14,
                  outlineColor: kCharcoal,
                  fontColor: kBlackColor,
                  backgroundColor: kQuaternaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientButton(
                      hasgrad: F,
                      text: 'Client documentation',
                      color: Color(0xffF8FAFC),
                      borderColor: kCharcoal,
                      fontcolor: kCharcoal,
                      fontSize: 14,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      fontWeight: wbold,
                      borderWidth: 1,
                      //  padding: EdgeInsets.all(4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
