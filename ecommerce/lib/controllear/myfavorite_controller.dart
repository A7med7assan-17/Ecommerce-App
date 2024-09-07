// ignore_for_file: unused_local_variable

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getInt('id')!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(int favoriteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = myFavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}




