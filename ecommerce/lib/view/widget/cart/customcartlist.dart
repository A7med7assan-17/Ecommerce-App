import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imageurl;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.imageurl,
      required this.count,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Row(
        children: [
          Expanded(
              flex: 3,
              child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/$imageurl",
                  height: 110,
                  width: 70,
                  fit: BoxFit.contain)),
          Expanded(
              flex: 4,
              child: ListTile(
                title: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  price,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                  height: 30,
                  child: IconButton(onPressed: onAdd, icon: Icon(Iconsax.add))),
              Container(
                  alignment: Alignment.bottomCenter,
                  height: 40,
                  child: Text(
                    count,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove, icon: Icon(Iconsax.minus))),
            ],
          )),
        ],
      )),
    );
  }
}
