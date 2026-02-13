import 'package:alpha_pilot/view/screens/launch/role_selection.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _initApp();
  }

  Future<void> _initApp() async {
    // Ensure splash stays total 3 sec
    await Future.delayed(const Duration(seconds: 3));

    // Navigate next
    Get.off(() => RoleSelection());
  }
}
