// ignore_for_file: deprecated_member_use
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/controllear/homescreen_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                key: _bottomNavigationKey,
                index: 0,
                height: 50.0,
                items: <Widget>[
                  Icon(Iconsax.home, size: 30, color: AppColor.primaryColor),
                  Icon(Iconsax.shopping_cart,
                      size: 30, color: AppColor.primaryColor),
                  Icon(Iconsax.profile_circle,
                      size: 30, color: AppColor.primaryColor),
                  Icon(Iconsax.setting_2,
                      size: 30, color: AppColor.primaryColor),
                ],
                color: Colors.black,
                buttonBackgroundColor: Colors.black,
                backgroundColor: AppColor.primaryColor,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 600),
                onTap: (index) {
                  setState(() {
                    controller.changePage(index);
                    controller.listpage.length + 1;
                  });
                },
              ),
              body: controller.listpage.elementAt(controller.currentpage),
            ));
  }
}
      //   floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     onPressed: () {
      //       controller.goToCart();
      //     },
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //     child: Icon(Iconsax.shopping_cart, color: AppColor.primaryColor),
      //   ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //   bottomNavigationBar: Container(
      //     decoration: BoxDecoration(boxShadow: <BoxShadow>[
      //       BoxShadow(
      //           color: const Color.fromARGB(108, 0, 0, 0),
      //           blurRadius: 20.0,
      //           offset: Offset(0.0, 0.75))
      //     ]),
      //     child: BottomAppBar(
      //       color: Colors.white,
      //       shape: CircularNotchedRectangle(),
      //       notchMargin: 5,
      //       child: Row(
      //         children: [
      //           ...List.generate(controller.listpage.length + 1, (index) {
      //             int i = index > 2 ? index - 1 : index;
      //             return index == 2
      //                 ? Spacer()
      //                 : CustomBottomAppBar(
      //                     textbottom: controller.bottomappbar[i]['title'],
      //                     icondata: controller.bottomappbar[i]['icon'],
      //                     onPressed: () {
      //                       controller.changePage(i);
      //                     },
      //                     active: controller.currentpage == i ? true : false,
      //                   );
      //           }),
      //         ],
      //       ),
      //     ),
      //   ),
      //   body: controller.listpage.elementAt(controller.currentpage),
      // ),

