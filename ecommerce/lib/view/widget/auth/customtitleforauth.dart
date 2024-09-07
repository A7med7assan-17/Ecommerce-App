import 'package:flutter/material.dart';

class CustomTilteForAuth extends StatelessWidget {
  final String title;
  const CustomTilteForAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700),
    );
  }
}



