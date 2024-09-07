import 'package:ecommerce/controllear/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommerce/view/widget/cart/customcartlist.dart';
import 'package:ecommerce/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MyCart'.tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavgationBarCart(
            controllercoupon: controller.controllerCoupon!,
            onApply: () {
              controller.checkCoupon();
            },
            onPlaceOrder: () {
              controller.goToPageCheckout();
            },
            shipping: "\$${controller.shipping}",
            discount: "\%${controller.discountCoupon}",
            price: "\$${cartController.priceOrders}",
            totalPrice: "\$${controller.getTotalPrice()}",
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(children: [
              SizedBox(height: 5),
              TopCardCart(
                message1: "YouHave".tr,
                message: '${cartController.totalcountitems}',
                message2: "IteminYourList".tr,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                        cartController.data.length,
                        (index) => CustomCartList(
                            onAdd: () async {
                              await cartController
                                  .add(cartController.data[index].itemsId!);
                              cartController.refreshPage();
                            },
                            onRemove: () async {
                              await cartController
                                  .delete(cartController.data[index].itemsId!);
                              cartController.refreshPage();
                            },
                            imageurl:
                                "${cartController.data[index].itemsImage}",
                            name:
                                "${translateDatabase(cartController.data[index].itemsNameAr, cartController.data[index].itemsName)}",
                            price: "\$${cartController.data[index].itemsprice}",
                            count: "${cartController.data[index].countitems}")),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
