import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Networking extends GetxController {
 
  
  static String currenyURL =
      'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies.json';
    String dropdownvalue = 'USD';
 String secondDropdownValue = 'INR';  
  List<String> currencies = [];

  Future<List<String>> getCurrencies() async {
    http.Response response = await http.get(Uri.parse(currenyURL));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body.toString().toUpperCase()) as Map;
      for (var name in decoded.keys) {
        currencies.add(name.toString());
       
        
      }
      return currencies;
     
    } else {
    
      throw 'Something went wrong!';
    }
  }

 
}
