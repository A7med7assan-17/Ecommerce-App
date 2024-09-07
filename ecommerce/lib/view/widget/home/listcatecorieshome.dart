import 'package:ecommerce/controllear/home_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoresmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  ListCategoriesHome({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 12),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  const Categories({super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.primaryColor,
              placeholderBuilder: (BuildContext context) =>
                  Center(child: const CircularProgressIndicator()),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: TextStyle(
                fontSize: 13,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
