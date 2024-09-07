import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controllear/favorite_controller.dart';
import 'package:ecommerce/controllear/items_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return InkWell(
      onTap: () {
        controller.goToPageProdctDetils(itemsModel);
      },
      child: Card(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${itemsModel.itemsImage}",
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
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
                          'Rating 3.5'.tr,
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
                          "\$${itemsModel.itemsPriceDiscount}",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, 0);
                                controller.removeFavorite(itemsModel.itemsId!);
                              } else {
                                controller.setFavorite(itemsModel.itemsId, 1);
                                controller.addFavorite(itemsModel.itemsId!);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == 1
                                  ? Iconsax.heart5
                                  : Iconsax.heart_add,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                top: -20,
                left: -10,
                child: Image.asset(
                  ImageAsset.saleone,
                  width: 80,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
