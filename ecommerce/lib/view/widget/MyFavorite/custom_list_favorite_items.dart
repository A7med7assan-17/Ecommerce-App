import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controllear/myfavorite_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoriteItems({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Hero(
            tag: "${myFavoriteModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/${myFavoriteModel.itemsImage}",
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "${translateDatabase(myFavoriteModel.itemsNameAr, myFavoriteModel.itemsName)}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rating3.5'.tr,
                textAlign: TextAlign.center,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 17,
                child: Row(
                  children: [
                    ...List.generate(
                        4,
                        (index) => Icon(
                              Iconsax.star1,
                              size: 17,
                              color: Color(0xffd4af37),
                            ))
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${myFavoriteModel.itemsPrice}",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.deleteFromFavorite(myFavoriteModel.favoriteId!);
                },
                icon: Icon(
                  Iconsax.heart_remove,
                  color: AppColor.primaryColor,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}