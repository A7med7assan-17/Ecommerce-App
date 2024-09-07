import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive == true ? AppColor.primaryColor : AppColor.secondColor,
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true ? Colors.white : AppColor.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

