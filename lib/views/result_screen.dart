import 'package:currency_converter/widgets/yellow_container.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
   const ResultScreen({Key? key}) : super(key: key);

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
                  onPressed: () {
                    Navigator.pushNamed(context, 'historyScreen');
                  },
                  icon: const Icon(Icons.history_sharp)),
              logoLeftText: 'AED',
              logorightText: 'INR',
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                      child: const Center(
                          child: Text(
                        '1 AED = 20.74',
                        style: TextStyle(
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
                      child: const Center(
                          child: Text(
                        '20 AED = 414.80',
                        style: TextStyle(
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
