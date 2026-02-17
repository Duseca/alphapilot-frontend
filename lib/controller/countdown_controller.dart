import 'dart:async';

import 'package:get/get.dart';

class CountdownController extends GetxController {
  var hours = 1.obs;
  var minutes = 12.obs;
  var seconds = 57.obs;
  Timer? timer;

  @override
  void onInit() {
    startCountdown();
    super.onInit();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        if (minutes.value > 0) {
          minutes.value--;
          seconds.value = 59;
        } else {
          if (hours.value > 0) {
            hours.value--;
            minutes.value = 59;
            seconds.value = 59;
          } else {
            timer.cancel();
          }
        }
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
