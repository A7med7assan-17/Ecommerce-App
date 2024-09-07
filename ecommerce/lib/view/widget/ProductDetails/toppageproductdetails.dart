import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controllear/productdetails_controller.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 340,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(68, 158, 158, 158),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  AppLink.imageItems + "/" + controller.itemsModel.itemsImage!,
              fit: BoxFit.contain,
            ),
          ),
        ),
      )
    ]);
  }
}
