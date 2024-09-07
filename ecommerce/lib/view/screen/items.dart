import 'package:ecommerce/controllear/favorite_controller.dart';
import 'package:ecommerce/controllear/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/widget/home/customappbar.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              CustomAppBar(
                mycontroller: controller.search!,
                titleappbar: 'find_product'.tr,
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconFav: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
              ),
              const SizedBox(height: 15),
              ListCategoriesItems(),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? GridView.builder(
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        })
                    : ListItemsSearch(listdataModel: controller.listdata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
