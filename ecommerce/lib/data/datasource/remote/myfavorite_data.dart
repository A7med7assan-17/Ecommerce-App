import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(int id) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int id) async {
    var response =
        await crud.postData(AppLink.deletefromfavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}

