import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 175,
            ),
            Image(
              image: AssetImage('assets/images/logoApp.png'),
              width: 310,
              height: 310,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonLang(
                  textbutton: 'ar'.tr,
                  onPressed: () {
                    controller.changeLang('ar');
                    Get.toNamed(AppRoute.onBoarding);
                  },
                ),
                SizedBox(
                  width: 50,
                ),
                CustomButtonLang(
                  textbutton: 'en'.tr,
                  onPressed: () {
                    controller.changeLang('en');
                    Get.toNamed(AppRoute.onBoarding);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
