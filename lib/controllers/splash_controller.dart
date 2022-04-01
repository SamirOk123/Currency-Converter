import 'dart:async';
import 'package:currency_converter/views/home_screen.dart';
import 'package:get/get.dart';
import 'networking_controller.dart';

class SplashController extends GetxController {
  NetworkingController networkingController = Get.find();
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => Get.offAll(const HomeScreen()));
    networkingController.getCurrencies();
    super.onInit();
  }
}
