import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  final String message1;
  final String message2;
  const TopCardCart(
      {super.key,
      required this.message,
      required this.message1,
      required this.message2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.only(bottom: 2),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message1,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            message2,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
