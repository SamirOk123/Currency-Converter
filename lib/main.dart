import 'package:currency_converter/controllers/amount_controller.dart';
import 'package:currency_converter/controllers/db_controller.dart';
import 'package:currency_converter/controllers/functions_controller.dart';
import 'package:currency_converter/controllers/networking_controller.dart';
import 'package:currency_converter/controllers/splash_controller.dart';
import 'package:currency_converter/views/history_screen.dart';
import 'package:currency_converter/views/home_screen.dart';
import 'package:currency_converter/views/result_screen.dart';
import 'package:currency_converter/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AmountController());
    Get.lazyPut(() => FunctionsController());
    Get.lazyPut(() => NetworkingController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => DbController());

    return GetMaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        'splashScreen': (context) => const SplashScreen(),
        'homeScreen': (context) => const HomeScreen(),
        'resultScreen': (context) => const ResultScreen(),
        'historyScreen': (context) => HistoryScreen(),
      },
    );
  }
}
