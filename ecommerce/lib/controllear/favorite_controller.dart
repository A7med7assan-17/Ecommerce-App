import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getInt('id')!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar(
          "Alert".tr,
          "TheProductHasBeenAddedToFavorites".tr,
          duration: Duration(seconds: 2),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite(int itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getInt('id')!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar(
          "Alert".tr,
          "TheProductHasBeenRemovedFromFavorites".tr,
          duration: Duration(seconds: 2),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}





