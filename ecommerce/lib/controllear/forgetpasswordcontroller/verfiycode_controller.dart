import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postdata(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.ResetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
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
    verifyCodeForgetPasswordData.resendData(email!);
  }
}





