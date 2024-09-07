import 'package:ecommerce/controllear/items_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoresmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  ListCategoriesItems({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 12),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              active: controller.selectedCat == index ? true : false,
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
    required this.active,
  });
  final CategoriesModel categoriesModel;
  final bool? active;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
            decoration: controller.selectedCat == i
                ? BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor)))
                : null,
            child: Text(
              "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: TextStyle(
                  fontSize: 20,
                  color:
                      active == true ? AppColor.primaryColor : Colors.grey[800],
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
