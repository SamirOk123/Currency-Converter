import 'package:currency_converter/views/history_screen.dart';
import 'package:currency_converter/views/home_screen.dart';
import 'package:currency_converter/views/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'homeScreen',
      routes: {
        'homeScreen': (context) => const HomeScreen(),
        'resultScreen': (context) => const ResultScreen(),
        'historyScreen': (context) => const HistoryScreen(),
      },
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
    );
  }
}
