import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goTologin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goTologin() {
    Get.offAllNamed(AppRoute.login);
  }
}
