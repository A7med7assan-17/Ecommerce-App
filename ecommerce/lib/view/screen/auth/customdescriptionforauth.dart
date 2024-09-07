import 'package:flutter/material.dart';

class CustomDescriptionForAuth extends StatelessWidget {
  final String description;
  const CustomDescriptionForAuth({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(135, 0, 0, 0),
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
