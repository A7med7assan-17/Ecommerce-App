import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'notvalidusername'.tr;
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'notvalidemail'.tr;
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'notvalidphone'.tr;
    }
  }

  if (val.isEmpty) {
    return "can'tbeEmpty".tr;
  }

  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be less than $max";
  }
}
