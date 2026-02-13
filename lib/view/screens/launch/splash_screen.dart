import 'package:alpha_pilot/controller/splash_controller.dart';
import 'package:alpha_pilot/generated/assets.dart';
import 'package:alpha_pilot/view/widget/moving_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the SplashController

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Binding the SplashController
    Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MovingIcon(path: Assets.imagesLogo, height: 88),

            // You can optionally add a loading indicator or animation here
          ],
        ),
      ),
    );
  }
}
