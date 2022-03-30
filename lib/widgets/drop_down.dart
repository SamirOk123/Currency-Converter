import 'package:currency_converter/networking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown extends StatelessWidget {
 
 

  const DropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Networking networking = Get.put(Networking());
    return Container(
      margin: const EdgeInsets.only(
        left: 45,
        right: 40,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            width: 100,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffebebeb),
            ),
            child: Center(
              child:GetBuilder<Networking>(
                  builder: (controller) {
                    return  DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                      // Initial Value
                      value: networking.dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: networking.currencies.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        
                       networking. dropdownvalue = newValue!;
                        controller.update();
                      },
                     ), );
                  },
                ),
              ),
            ),
          
          Image.asset(
            'assets/icons/arrow.png',
            width: 30,
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            width: 100,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffebebeb),
            ),
            child: Center(
              child: GetBuilder<Networking>(builder: (controller) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    // Initial Value
                    value:networking. secondDropdownValue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: networking.currencies.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                     networking. secondDropdownValue = newValue!;
                      controller.update();
                    },
                  ),
                );
              }),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
