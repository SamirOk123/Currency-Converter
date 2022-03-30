import 'dart:async';
import 'package:currency_converter/networking.dart';
import 'package:currency_converter/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  Networking networking = Get.put(Networking());
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
    networking.getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffd470),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: const Color(0xfff5cb6c),
          child: Image.asset(
            'assets/icons/currency.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
