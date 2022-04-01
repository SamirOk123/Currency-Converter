import 'package:currency_converter/constants.dart';
import 'package:flutter/material.dart';

class YellowContainer extends StatelessWidget {
  const YellowContainer(
      {Key? key,
      this.action,
      this.leading,
      this.logoLeftText,
      this.logorightText})
      : super(key: key);

  final Widget? leading;
  final Widget? action;
  final String? logoLeftText;
  final String? logorightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: kYellow,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Row(
              children: [
                leading!,
                const Text(
                  'Currency Converter',
                  style: TextStyle(
                      fontSize: 27,
                      fontFamily: 'Samir',
                      fontWeight: FontWeight.bold),
                ),
                action!
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  logoLeftText!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Samir',
                      fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor:const Color(0xfff5cb6c),
                  child: Image.asset(
                    'assets/icons/currency.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                Text(
                  logorightText!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Samir',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 32),
          )
        ],
      ),
    );
  }
}
