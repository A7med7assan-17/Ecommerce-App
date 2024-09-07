import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(int id, int userid) async {
    var response =
        await crud.postData(AppLink.items, {"id": id.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
