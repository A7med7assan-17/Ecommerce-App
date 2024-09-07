import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 49,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
