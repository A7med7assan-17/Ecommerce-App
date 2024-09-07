import 'package:ecommerce/controllear/home_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  final String titlecard;
  final String subtitlecard;

  const CustomCardHome(
      {super.key, required this.titlecard, required this.subtitlecard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
              titlecard,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              subtitlecard,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(30)),
        ),
        Positioned(
          top: -20,
          right: controller.lang == "en" ? -20 : null,
          left: controller.lang == "ar" ? -20 : null,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 64, 250),
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ]),
    );
  }
}
