// ignore_for_file: unused_import
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // start services
    sharedPreferences = await SharedPreferences.getInstance();
    // end  
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}