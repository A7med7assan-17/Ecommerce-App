import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  intialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  int countitems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsmodel"];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {
      'name': 'orange',
      'id': 1,
      'active': "0",
      'color': Colors.orange,
    },
    {
      'name': 'Black',
      'id': 2,
      'active': "1",
      'color': Colors.black,
    },
    {
      'name': 'Green',
      'id': 3,
      'active': "0",
      'color': Colors.green,
    },
    {
      'name': 'blue',
      'id': 4,
      'active': "0",
      'color': Colors.blue,
    },
  ];

  getCountItems(int itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getInt('id')!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response["data"];
        print("====================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addItems(int itemsid) async {
    // statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getInt("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar(
          "Alert".tr,
          "TheProductHasBeenAddedToCart".tr,
          duration: Duration(seconds: 2),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteitems(int itemsid) async {
    // statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getInt('id')!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar(
          "Alert".tr,
          "TheProductHasBeenRemovedFromCart".tr,
          duration: Duration(seconds: 2),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  add() {
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
