import 'package:currency_converter/controllers/amount_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key}) : super(key: key);

  AmountController amountController = Get.put(AmountController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      margin: const EdgeInsets.only(
        left: 45,
        right: 40,
      ),
      child: TextField(
        controller: amountController.amountTextController,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], // Only numbers can be entered
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Enter an amount',
          filled: true,
          fillColor: const Color(0xffebebeb),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
