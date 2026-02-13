// Controller for managing PIN state
import 'package:alpha_pilot/view/screens/birgade_module/sos_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PinLoginController extends GetxController {
  final RxString pin = ''.obs;

  void addDigit(String digit) {
    if (pin.value.length < 4) {
      pin.value += digit;

      if (pin.value.length == 4) {
        Future.delayed(const Duration(milliseconds: 200), () {
          submitPin();
        });
      }
    }
  }

  void removeDigit() {
    if (pin.value.isNotEmpty) {
      pin.value = pin.value.substring(0, pin.value.length - 1);
    }
  }

  void submitPin() {
    // TODO: Add real authentication logic here.
    if (pin.value == "1234") {
      Get.snackbar("Success", "PIN verified");
      Get.offAll(() => SosList());
    } else {
      Get.snackbar(
        "Error",
        "Incorrect PIN",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      pin.value = '';
    }
  }

  void handleFingerprint() {
    // Get.to(() => FingerLogin());
  }
}
