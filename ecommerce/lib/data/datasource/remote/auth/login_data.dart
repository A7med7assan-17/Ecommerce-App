import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    var response = await crud
        .postData(AppLink.Login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
