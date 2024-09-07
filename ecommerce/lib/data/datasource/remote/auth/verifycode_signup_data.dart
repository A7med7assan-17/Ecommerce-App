import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.VerfiyCodeSignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
