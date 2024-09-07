import 'package:ecommerce/controllear/home_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, int catval);
  getItems(int categoryid);
  goToPageProdctDetils(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  int? catid;
  List data = [];

  ItemsData itemsData = ItemsData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getInt('id')!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  goToPageProdctDetils(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
