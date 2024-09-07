import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  TextEditingController? controllerCoupon;

  int? discountCoupon = 0;
  String? couponName;
  int? couponid;
  CouponModel? couponModel;

  int shipping = 50;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];
  num priceOrders = 0;
  num totalcountitems = 0;

  add(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getInt('id')!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Alert".tr,
            messageText: Text(
              "TheProductHasBeenAddedToCart".tr,
              style: TextStyle(color: AppColor.primaryColor),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(int itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getInt('id')!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Alert".tr,
            messageText: Text("TheProductHasBeenRemovedFromCart".tr,
                style: TextStyle(color: AppColor.primaryColor)));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountCoupon = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        discountCoupon = 0;
        couponName = null;
        couponid = null;
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty)
      return Get.snackbar(
        "Alert".tr,
        "Cartempty".tr,
        duration: Duration(seconds: 2),
      );
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? 0,
      "priceorder": priceOrders,
      "pricedelivery": shipping,
    });
  }

  getTotalPrice() {
    return (priceOrders - priceOrders * discountCoupon! / 100 + shipping);
  }

  resetVarCart() {
    totalcountitems = 0;
    priceOrders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getInt('id')!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response["datacart"]['status'] == 'success') {
          List dataresponse = response["datacart"]['data'];
          Map dataresponsecountprice = response["countprice"];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = dataresponsecountprice["totalcount"];
          priceOrders = dataresponsecountprice["totalprice"];
          print(priceOrders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    super.onInit();
  }
}
