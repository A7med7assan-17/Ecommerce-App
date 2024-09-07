import 'package:ecommerce/controllear/productdetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/view/widget/ProductDetails/priceandcount.dart';
import 'package:ecommerce/view/widget/ProductDetails/toppageproductdetails.dart';
import 'package:ecommerce/view/widget/home/customtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "${translateDatabase(controller.itemsModel.categoriesNameAr, controller.itemsModel.categoriesName)}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child: MaterialButton(
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: Text(
              'GoToCart'.tr,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(children: [
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TopProductPageDetails()),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    PriceAndCountItems(
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                      count: "${controller.countitems}",
                      price: "\$${controller.itemsModel.itemsPriceDiscount}",
                    ),
                    Divider(),
                    CustomTitle(
                      paddingTitle: 15,
                      nameTitle: 'Description'.tr,
                      sizeTitle: 17,
                      colorTitle: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
