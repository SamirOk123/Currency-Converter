import 'package:currency_converter/views/home_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

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
                              Navigator.popUntil(context, ModalRoute.withName('homeScreen'),);
                            },
                            icon: const Icon(Icons.home_filled)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Padding(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: const Color(0xfff5cb6c),
                      child: Image.asset(
                        'assets/icons/currency.png',
                        width: 80,
                        height: 80,
                      ),
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
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return false;
                },
                child: ListView.builder(itemCount: 15,itemBuilder: (context,indext){
                  return Container(
                      margin: const EdgeInsets.only(top: 18,left: 50,right: 50),
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: 120,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: const Color(0xffebebeb),
                      ),
                   child: Center(
                          child: Text(
                        '20 AED = 414.80 INR',
                        style: TextStyle(
                            fontFamily: 'Samir',
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )), );
                }),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
