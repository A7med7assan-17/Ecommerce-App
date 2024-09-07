import 'package:ecommerce/controllear/cart_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/view/widget/cart/custoombottoncoubon.dart';
import 'package:ecommerce/view/widget/cart/cutombottoncard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final void Function()? onApply;
  final void Function()? onPlaceOrder;
  final TextEditingController controllercoupon;
  const BottomNavgationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalPrice,
      required this.controllercoupon,
      this.onApply,
      this.onPlaceOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: controllercoupon,
                              decoration: InputDecoration(
                                  hintText: "couponCode".tr,
                                  isDense: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtonCoubon(
                              textbutton: "apply".tr,
                              onPressed: onApply,
                            )),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CouponCode:".tr,
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${controller.couponName!}",
                        style: TextStyle(
                            color: AppColor.greyColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
        Container(
          margin: EdgeInsets.all(9),
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.primaryColor, width: 2)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Price'.tr, style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(price, style: TextStyle(fontSize: 16))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text('discount'.tr, style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(discount, style: TextStyle(fontSize: 16))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text('Shipping'.tr, style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(shipping, style: TextStyle(fontSize: 16))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('TotalPrice'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor))),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(totalPrice,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomButtonCart(
          textbutton: 'PlaceOrder'.tr,
          onPressed: onPlaceOrder,
        ),
      ],
    ));
  }
}

