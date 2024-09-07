import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLink.cartAdd,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLink.cartDelete,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(int usersid, int itemsid) async {
    var response = await crud.postData(AppLink.cartGetCountItems,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(int usersid) async {
    var response =
        await crud.postData(AppLink.cartView, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkCoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
