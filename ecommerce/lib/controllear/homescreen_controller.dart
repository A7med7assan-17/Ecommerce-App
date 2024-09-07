import 'package:ecommerce/view/screen/settings.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listpage = [
    HomePage(),
    Cart(),
    Profile(),
    Settings(),
  ];

  // List bottomappbar = [
  //   {'title': 'Home'.tr, 'icon': Iconsax.home},
  //   {'title': 'Settings'.tr, 'icon': Iconsax.setting},
  //   {'title': 'Favorite'.tr, 'icon': Iconsax.search_favorite},
  //   {'title': 'Profile'.tr, 'icon': Iconsax.profile_circle},
  // ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
