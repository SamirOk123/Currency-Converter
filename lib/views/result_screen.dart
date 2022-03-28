import 'package:currency_converter/views/history_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xffffd470),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const Text(
                          'Currency Converter',
                          style: TextStyle(
                              fontSize: 27,
                              fontFamily: 'Samir',
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                             Navigator.pushNamed(context, 'historyScreen');
                            },
                            icon: const Icon(Icons.history_sharp)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Padding(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('AED',style: TextStyle(fontSize: 25,fontFamily: 'Samir',fontWeight: FontWeight.bold),),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: const Color(0xfff5cb6c),
                          child: Image.asset(
                            'assets/icons/currency.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                     Text('INR',style: TextStyle(fontSize: 25,fontFamily: 'Samir',fontWeight: FontWeight.bold),), ],
                    ),
                    padding: const EdgeInsets.only(top: 32),
                  )
                ],
              ),
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
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 150,
                    decoration: BoxDecoration(
                        color: const Color(0xffebebeb),
                        borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                    child: Center(
                        child: Text(
                      '1 AED = 20.74',
                      style: TextStyle(
                          fontFamily: 'Samir',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 18),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: const Color(0xffebebeb),
                    ),
                 child: Center(
                        child: Text(
                      '20 AED = 414.80',
                      style: TextStyle(
                          fontFamily: 'Samir',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )), ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
