import 'package:currency_converter/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FunctionsController extends GetxController {
  void showToast(String label) {
    Fluttertoast.showToast(
        msg: label,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showSnackBar() {
    Get.snackbar(
      'Something went wrong',
      'Please check your Internet connection',
      icon: Image.asset(
        'assets/icons/no-signal.png',
        width: 18,
        height: 18,
        color: kWhite,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: kWhite,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
