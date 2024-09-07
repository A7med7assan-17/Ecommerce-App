import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(int usersid, int itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int usersid, int itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}



