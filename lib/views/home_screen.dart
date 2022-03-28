import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> dropdownItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];
  String? value;
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
                  const Padding(
                    padding: EdgeInsets.only(top: 22),
                    child: Text(
                      'Currency Converter',
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Samir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    child: Hero(
                      tag: 'logo',
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: const Color(0xfff5cb6c),
                        child: Image.asset(
                          'assets/icons/currency.png',
                          width: 80,
                          height: 80,
                        ),
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
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 45, right: 40, top: 65),
                      child: TextField(
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
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 45, right: 40, top: 25),
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                items:
                                    dropdownItems.map(buildMenuItem).toList(),
                                onChanged: (value) => setState(
                                  () {
                                    this.value = value;
                                  },
                                ),
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                items:
                                    dropdownItems.map(buildMenuItem).toList(),
                                onChanged: (value) => setState(
                                  () {
                                    this.value = value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'resultScreen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffffd470),
                        ),
                        height: 57,
                        margin:
                            const EdgeInsets.only(left: 45, right: 40, top: 25),
                        child: const Center(
                          child: Text(
                            'Convert',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }
}
