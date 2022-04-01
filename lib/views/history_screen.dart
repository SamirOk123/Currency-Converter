import 'package:currency_converter/constants.dart';
import 'package:currency_converter/controllers/db_controller.dart';
import 'package:currency_converter/controllers/functions_controller.dart';
import 'package:currency_converter/models/db_model.dart';
import 'package:currency_converter/views/home_screen.dart';
import 'package:currency_converter/widgets/yellow_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DatabaseConnect databaseConnect = DatabaseConnect();

  FunctionsController functionsController = Get.find();

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
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
                  child: FutureBuilder(
                    future: databaseConnect.getHistory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List history = snapshot.data as List;
                        return ListView.builder(
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onLongPress: () {
                                functionsController.showDialog(
                                    title: 'Warning',
                                    content: 'Are you sure to delete this?',
                                    onDelete: () {
                                      dbController
                                          .deleteHistory(history[index].id);
                                      // controller.update();
                                      setState(() {});
                                      Get.back();
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 18, left: 60, right: 50),
                                width: MediaQuery.of(context).size.width * 0.70,
                                height: 120,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Color(0xffebebeb),
                                ),
                                child: Center(
                                  child: Text(
                                    history[index].value,
                                    style: const TextStyle(
                                        fontFamily: 'Samir',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
