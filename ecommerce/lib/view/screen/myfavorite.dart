import 'package:ecommerce/controllear/myfavorite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/MyFavorite/custom_list_favorite_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: Text("MyFavorite".tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                              itemBuilder: (context, index) {
                                return CustomListFavoriteItems(
                                  myFavoriteModel: controller.data[index],
                                );
                              },
                            ))
                      ],
                    ),
                  ))),
    );
  }
}
