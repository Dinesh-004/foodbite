import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:foodbite/dashboard.dart';
import 'package:foodbite/firebase_options.dart';
import 'package:foodbite/signin.dart';
import 'package:foodbite/splash.dart';
import 'package:foodbite/theme/themes.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainController mainController = Get.put(MainController(),permanent: true);
  
 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
          home: Splash(
          onSplashComplete: () {
            if (mainController.isLoggedIn.value) {
              Get.offAll(() => Dashboard());
            } else {
              Get.offAll(() => Signin());
            }
          },
      ),
      );
  }
}