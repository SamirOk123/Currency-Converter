import 'package:currency_converter/constants.dart';
import 'package:currency_converter/views/home_screen.dart';
import 'package:currency_converter/widgets/yellow_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
   const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                icon: const Icon(Icons.home),
                onPressed: () {
               Get.offAll(const HomeScreen());
                },
              ),
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
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowIndicator();
                    return false;
                  },
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, indext) {
                        return Container(
                          margin: const EdgeInsets.only(
                              top: 18, left: 50, right: 50),
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffebebeb),
                          ),
                          child: const Center(
                            child: Text(
                              '20 AED = 414.80 INR',
                              style: TextStyle(
                                  fontFamily: 'Samir',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
