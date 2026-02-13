import 'dart:io';

import 'package:alpha_pilot/view/screens/launch/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alpha_pilot/const/app_colors.dart';
import 'package:alpha_pilot/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
  //  Get.put(LandingController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

final String dummyImage2 =
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D';
final String dummyImage =
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
final String dummyImage3 =
    'https://images.unsplash.com/photo-1736144287605-3919f585752c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMzR8fHxlbnwwfHx8fHw%3D';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  final LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,

      title: 'Alpha Pilot',
      //theme: lightTheme,
      theme: lightTheme,
      themeMode: ThemeMode.system,

      ///  themeMode: ThemeMode.light,
      // initialBinding: InitialBindings(),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
