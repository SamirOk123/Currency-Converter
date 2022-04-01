import 'package:currency_converter/constants.dart';
import 'package:currency_converter/controllers/amount_controller.dart';
import 'package:currency_converter/models/result_screen_arguments.dart';
import 'package:currency_converter/controllers/networking_controller.dart';
import 'package:currency_converter/widgets/yellow_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AmountController amountController = Get.find();
    NetworkingController networkingController = Get.find();
    //recieving data from homeScreen
    final arguments =
        ModalRoute.of(context)?.settings.arguments as ResultScreenArguments;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            YellowContainer(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              action: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'historyScreen');
                  },
                  icon: const Icon(Icons.history_sharp)),
              logoLeftText: networkingController.dropdownvalue,
              logorightText: networkingController.secondDropdownValue,
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Color(0xffebebeb),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                          child: Text(
                        '1 ${networkingController.dropdownvalue} = ${arguments.firstValue.toDouble().toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontFamily: 'Samir',
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xffebebeb),
                      ),
                      child: Center(
                          child: Text(
                        '${amountController.amountTextController.text} ${networkingController.dropdownvalue} = ${arguments.secondValue.toDouble().toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontFamily: 'Samir',
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
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
