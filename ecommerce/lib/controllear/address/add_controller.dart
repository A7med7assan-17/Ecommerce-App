import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  intialData() {
    name   = TextEditingController();
    city   = TextEditingController();
    street = TextEditingController();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getInt("id")!,
        name!.text,
        city!.text,
        street!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.HomePage);
        Get.snackbar(
          "Alert".tr,
          "Your address has been added".tr,
          duration: Duration(seconds: 2),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
