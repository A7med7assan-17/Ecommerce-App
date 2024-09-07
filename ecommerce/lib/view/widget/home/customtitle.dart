import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String nameTitle;
  final double sizeTitle;
  final double paddingTitle;
  final Color colorTitle;
  const CustomTitle(
      {super.key,
      required this.nameTitle,
      required this.sizeTitle,
      required this.colorTitle,
      required this.paddingTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTitle),
      child: Text(
        nameTitle,
        style: TextStyle(
          fontSize: sizeTitle,
          fontWeight: FontWeight.w600,
          color: colorTitle,
        ),
      ),
    );
  }
}
