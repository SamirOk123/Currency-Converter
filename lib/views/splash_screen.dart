import 'package:currency_converter/constants.dart';
import 'package:currency_converter/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: kYellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: kYellow,
                child: Image.asset(
                  'assets/icons/currency.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SpinKitThreeInOut(
                color: kWhite,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
