// ignore_for_file: unused_local_variable

import 'package:ecommerce/controllear/checkout_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    ChcekoutController controller = Get.put(ChcekoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckOut".tr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor),
                onPressed: () {
                  controller.checkout();
                },
                child: Text(
                  "CheckOut".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ChcekoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    "ChoosePaymentMethod".tr,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod(0);
                    },
                    child: CardPaymentMethodCheckout(
                      title: "Cash".tr,
                      isActive: controller.paymentMethod == 0
                          ? true
                          : false, // 0 = cash
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod(1);
                    },
                    child: CardPaymentMethodCheckout(
                      title: "PaymentCards".tr,
                      isActive: controller.paymentMethod == 1
                          ? true
                          : false, // 1 = cards
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ChooseDeliveryType".tr,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType(0);
                        },
                        child: CardDeliveryTypeCheckout(
                          title: "Delivery".tr,
                          imagename: ImageAsset.delivery,
                          isActive: controller.deliveryType == 0
                              ? true
                              : false, // 0 = Delivery
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType(1);
                        },
                        child: CardDeliveryTypeCheckout(
                          title: "receive".tr,
                          imagename: ImageAsset.drivethru,
                          isActive: controller.deliveryType == 1
                              ? true
                              : false, // 1 = receive
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (controller.deliveryType == 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ShippingAddress".tr,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          controller.dataaddress.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.chooseShippingAddress(
                                  controller.dataaddress[index].addressId!);
                            },
                            child: CardShippingAddressCheckout(
                              titleCard:
                                  "${controller.dataaddress[index].addressName}",
                              subtitleCard:
                                  "${controller.dataaddress[index].addressCity} \ ${controller.dataaddress[index].addressStreet}",
                              isActive: controller.addressid ==
                                      controller.dataaddress[index].addressId
                                  ? true
                                  : false,
                            ),
                          ),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
