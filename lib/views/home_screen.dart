import 'package:currency_converter/constants.dart';
import 'package:currency_converter/widgets/convert_button.dart';
import 'package:currency_converter/widgets/drop_down.dart';
import 'package:currency_converter/widgets/text_field.dart';
import 'package:currency_converter/widgets/yellow_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const YellowContainer(
              leading: SizedBox(),
              action: SizedBox(),
              logoLeftText: '',
              logorightText: '',
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                ),
                child: Column(
                  children: [
                    CustomTextField(),
                    const DropDown(),
                    ConvertButton(),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
