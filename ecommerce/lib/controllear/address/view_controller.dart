import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  deleteAddress(int addressid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressData.getData(myServices.sharedPreferences.getInt("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}


