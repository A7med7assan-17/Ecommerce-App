import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMixController {
  initialData();
  getdata();
  searchData();
  goToItems(List categories, int selectedCat, int categoryid);
  goToPageProdctDetils(ItemsModel itemsModel);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  // List data = [];
  List categories = [];
  List items = [];
  String? username;
  String? email;
  String? phone;
  int? id;
  late StatusRequest statusRequest;
  String? lang;

  HomeData homeData = HomeData(Get.find());

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProdctDetils(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.Items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
