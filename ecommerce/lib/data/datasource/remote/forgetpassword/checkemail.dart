import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.Checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
