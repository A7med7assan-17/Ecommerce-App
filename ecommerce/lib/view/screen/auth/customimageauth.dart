import 'package:flutter/material.dart';

class CustomImageAuth extends StatelessWidget {
  final String image;
  const CustomImageAuth({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        shape: OvalBorder(),
      ),
    );
  }
}
