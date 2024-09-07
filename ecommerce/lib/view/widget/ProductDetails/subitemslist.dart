import 'package:ecommerce/controllear/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  final isActive;
  const SubItemsList({super.key, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
              controller.subitems.length,
              (index) => Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 5),
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: controller.subitems[index]['color']),
                    color: controller.subitems[index]['active'] == "1"
                        ? controller.subitems[index]['color']
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  controller.subitems[index]['name'],
                  style: TextStyle(
                      height: 1.1,
                      color: controller.subitems[index]['active'] == "1"
                          ? Colors.white
                          : controller.subitems[index]['color'],
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
