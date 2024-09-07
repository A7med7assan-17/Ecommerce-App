import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String title;
  final String imagename;
  final bool isActive;
  const CardDeliveryTypeCheckout(
      {super.key,
      required this.title,
      required this.isActive,
      required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 120,
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.primaryColor, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 70,
            color: isActive == true ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive == true ? Colors.white : AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}



