import 'dart:convert';
import 'package:currency_converter/constants.dart';
import 'package:currency_converter/controllers/amount_controller.dart';
import 'package:currency_converter/controllers/functions_controller.dart';
import 'package:currency_converter/models/result_screen_arguments.dart';
import 'package:currency_converter/controllers/networking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConvertButton extends StatelessWidget {
  ConvertButton({Key? key}) : super(key: key);

  var valueOfToCurrency;
  var multipledValue;

  @override
  Widget build(BuildContext context) {
    NetworkingController networkingController = Get.put(NetworkingController());
    AmountController amountController = Get.find();
    FunctionsController functionsController = Get.put(FunctionsController());
    return InkWell(
      onTap: () async {
        if (amountController.amountTextController.text.isEmpty) {
          functionsController.showToast('Please enter an amount');
        } else {
//converting
          var data = await networkingController.getExchangeRate(
              networkingController.dropdownvalue,
              networkingController.secondDropdownValue);
          if (data==null) {
            print('data is null');
          } else {
            var decoded = jsonDecode(data);
            valueOfToCurrency = decoded[networkingController.secondDropdownValue
                .toLowerCase()
                .toString()];

            multipledValue =
                double.parse(amountController.amountTextController.text) *
                    valueOfToCurrency;

            Navigator.pushNamed(context, 'resultScreen',
                arguments: ResultScreenArguments(
                    firstValue: valueOfToCurrency,
                    secondValue: multipledValue));
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kYellow,
        ),
        height: 57,
        margin: const EdgeInsets.only(
          left: 45,
          right: 40,
        ),
        child: const Center(
          child: Text(
            'Convert',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
