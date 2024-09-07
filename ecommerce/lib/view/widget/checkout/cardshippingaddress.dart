import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  final String titleCard;
  final String subtitleCard;
  final bool isActive;
  const CardShippingAddressCheckout(
      {super.key,
      required this.titleCard,
      required this.subtitleCard,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: isActive == true ? AppColor.primaryColor : Colors.white,
      child: ListTile(
        title: Text(
          titleCard,
          style: TextStyle(
              color: isActive == true ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitleCard,
          style: TextStyle(
              color: isActive == true ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}



