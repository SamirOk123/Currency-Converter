import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'resultScreen');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xffffd470),
        ),
        height: 57,
        margin: const EdgeInsets.only(
          left: 45,
          right: 40,
        ),
        child: const Center(
          child: Text(
            'Convert',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
