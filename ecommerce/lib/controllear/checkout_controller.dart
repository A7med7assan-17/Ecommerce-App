import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ChcekoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  List<AddressModel> dataaddress = [];

  int? paymentMethod;
  int? deliveryType;
  int addressid = 0;

  late int couponid;
  late int pricedelivery;
  late int priceorder;

  choosePaymentMethod(int val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(int val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(int val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    dataaddress.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressData.getData(myServices.sharedPreferences.getInt("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Alert".tr, "Pleaseselectapaymentmethod".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("Alert".tr, "PleaseselectaorderType".tr);
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getInt("id").toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": pricedelivery.toString(),
      "ordersprice": priceorder.toString(),
      "couponid": couponid.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.getData(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.HomePage);
        Get.snackbar("Success".tr, "Orderedsuccessfully".tr);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Alert".tr, "tryagain".tr);
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    pricedelivery = Get.arguments['pricedelivery'];
    getShippingAddress();
    super.onInit();
  }
}
