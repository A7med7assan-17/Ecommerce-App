import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(
        AppLink.Resetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
