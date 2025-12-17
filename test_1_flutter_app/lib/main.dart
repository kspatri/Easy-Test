import 'package:easy_test/View/Screens/login_screen.dart';
import 'package:easy_test/View/SplashView/Splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      title: 'Easy Test',
  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
