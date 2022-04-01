import 'package:currency_converter/controllers/networking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown extends StatelessWidget {
  const DropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NetworkingController networkingController = Get.put(NetworkingController());
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
              child: GetBuilder<NetworkingController>(
                builder: (controller) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: networkingController.dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: networkingController.currencies.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        networkingController.dropdownvalue = newValue!;
                        controller.update();
                      },
                    ),
                  );
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
              child: GetBuilder<NetworkingController>(builder: (controller) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: networkingController.secondDropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: networkingController.currencies.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      networkingController.secondDropdownValue = newValue!;
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
