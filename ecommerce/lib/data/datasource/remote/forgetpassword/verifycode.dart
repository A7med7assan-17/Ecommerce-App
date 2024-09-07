import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String VerifyCode) async {
    var response = await crud.postData(
        AppLink.Verifycode, {"email": email, "verifycode": VerifyCode});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
