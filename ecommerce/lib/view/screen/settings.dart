import 'package:ecommerce/controllear/settings_controller.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            children: [
              Ink(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.orangeAccent,
                    Colors.deepOrangeAccent,
                    Colors.deepOrange,
                    Color(0xffED7A07),
                  ]),
                ),
              ),
              Ink(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 140),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.orangeAccent,
                            Colors.deepOrangeAccent,
                            Colors.deepOrange,
                            AppColor.primaryColor,
                          ]),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(85),
                            child: Image.asset('assets/images/icon_logo.png',
                                width: 85, height: 85, fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressView);
                  },
                  trailing: Icon(Iconsax.location),
                  title: Text('Address'.tr),
                ),
                ListTile(
                  onTap: () {
                    Get.defaultDialog(
                        title: "Aboutus".tr, middleText: "massegeAbout".tr);
                  },
                  trailing: Icon(Iconsax.info_circle),
                  title: Text('Aboutus'.tr),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Iconsax.call_incoming),
                  title: Text('Contactus'.tr),
                ),
                ListTile(
                  onTap: () {
                    controller.Logout();
                  },
                  title: Text('Logout'.tr),
                  trailing: Icon(Iconsax.logout),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
