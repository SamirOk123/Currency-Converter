import 'dart:convert';
import 'dart:io';
import 'package:currency_converter/app_exceptions.dart';
import 'package:currency_converter/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'functions_controller.dart';

class NetworkingController extends GetxController {
  FunctionsController functionsController = Get.find();
  //Variables for storing initial value of drop down
  String dropdownvalue = 'USD';
  String secondDropdownValue = 'INR';

  // List for storing currency names
  List<String> currencies = [];
  var  exchangeRate;

  // Method for getting currencies
  Future<List<String>> getCurrencies() async {
    try {
      http.Response response = await http.get(Uri.parse(kCurrenyURL));
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body.toString().toUpperCase()) as Map;
        for (var name in decoded.keys) {
          currencies.add(name.toString());
        }
      }else if (response.statusCode==400){
        throw FetchDataException();
      }
    } catch (e) {
      if (e is SocketException) {
        functionsController.showSnackBar();
      }else if (e is FetchDataException){
        functionsController.showSnackBar();
      }
    }
    return currencies;
  }

  //Method for converting currencies
  Future getExchangeRate(String from, String to) async {
    try {
      http.Response response = await http.get(Uri.parse(
          kExchangeRateURL + '${from.toLowerCase()}/${to.toLowerCase()}.json'));
      if (response.statusCode == 200) {
        exchangeRate = response.body;
      }else if(response.statusCode==400){
        throw FetchDataException('Something went wrong');
      }
    } catch (e) {
      if (e is SocketException) {
        functionsController.showSnackBar();
      }else if (e is FetchDataException){
        functionsController.showSnackBar();
      }
    }

    return exchangeRate;
  }
}
