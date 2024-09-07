// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/controllear/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/widget/home/customappbar.dart';
import 'package:ecommerce/view/widget/home/customcardhome.dart';
import 'package:ecommerce/view/widget/home/customtitle.dart';
import 'package:ecommerce/view/widget/home/listcatecorieshome.dart';
import 'package:ecommerce/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Future<void> _refresh() async {
//   return await Future.delayed(Duration(seconds: 2), () {
//     HomePage();
//   });
// }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (a, b, c) => HomeScreen() ,
                    transitionDuration: Duration(seconds: 3),
                  ));
              setState(() {});
            },
            child: ListView(
              children: [
                SizedBox(height: 10),
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
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCardHome(
                              titlecard: 'ASummerSurprise'.tr,
                              subtitlecard: 'Cashback20%'.tr,
                            ),
                            CustomTitle(
                              nameTitle: 'Categories'.tr,
                              sizeTitle: 20,
                              colorTitle: AppColor.primaryColor,
                              paddingTitle: 0,
                            ),
                            SizedBox(height: 10),
                            ListCategoriesHome(),
                            CustomTitle(
                              nameTitle: 'Offers'.tr,
                              sizeTitle: 20,
                              colorTitle: AppColor.primaryColor,
                              paddingTitle: 10,
                            ),
                            SizedBox(height: 10),
                            ListItemsHome(),
                          ],
                        )
                      : ListItemsSearch(listdataModel: controller.listdata),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listdataModel;

  const ListItemsSearch({super.key, required this.listdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdataModel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProdctDetils(listdataModel[index]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.imageItems}/${listdataModel[index].itemsImage}",
                              height: 110,
                              width: 70,
                              fit: BoxFit.contain)),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                              "${translateDatabase(listdataModel[index].itemsNameAr!, listdataModel[index].itemsName!)}"),
                          subtitle: Text(
                              "${translateDatabase(listdataModel[index].categoriesNameAr!, listdataModel[index].categoriesName!)}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
