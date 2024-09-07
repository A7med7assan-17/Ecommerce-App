import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode_signup_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSuccessSignUp(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postdata(email!, verifyCodeSignUp);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.SuccessSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning".tr, middleText: "VerifyCodeNotCorrect".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  reSend() {
    verifyCodeSignUpData.resendData(email!);
  }
}
