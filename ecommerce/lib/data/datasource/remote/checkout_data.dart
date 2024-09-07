import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  getData(Map data) async {
    var response = await crud.postData(AppLink.ordersCheckout, data);
    return response.fold((l) => l, (r) => r);
  }
}
