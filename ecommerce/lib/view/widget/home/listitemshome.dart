import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controllear/home_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 10),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return ItemsHome(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  const ItemsHome({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controllerItems = Get.put(HomePageControllerImp());
    return InkWell(
      onTap: () {
        controllerItems.goToPageProdctDetils(itemsModel);
      },
      child: Container(
        width: 200,
        height: 260,
        child: Card(
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageItems}/${itemsModel.itemsImage}",
                          width: 170,
                          height: 145,
                          fit: BoxFit.contain,
                        ),
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${itemsModel.itemsPriceDiscount}",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "\$${itemsModel.itemsPrice}",
                            style: TextStyle(
                              color: AppColor.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
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
      ),
    );
  }
}
