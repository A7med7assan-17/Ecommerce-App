import 'package:ecommerce/controllear/onboarding_controlar.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce/view/widget/onboarding/customslider.dart';
import 'package:ecommerce/view/widget/onboarding/dotcontrolar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الكلاس الذي يمثل شاشة OnBoarding.
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا يتم إضافة كنترولر OnBoardingControllerImp لإدارة الشاشة.
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // هنا يتم عرض الشريحة التي تحتوي على المحتوى التوضيحي.
            const Expanded(
              flex: 3,
              child: SliderOnBoardring(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // هنا يتم عرض عناصر التحكم بالشريحة مثل النقاط والأزرار.
                  const CustomDotControlarOnBordering(),
                  const SizedBox(height: 30),
                  // هنا يتم عرض زر مخصص للانتقال للشاشة التالية.
                  const CustomButtonOnBoarding(),
                  const SizedBox(height: 15),
                  // هنا يتم عرض زر للانتقال لشاشة تسجيل الدخول.
                  Container(
                    height: 45,
                    width: 238,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2, color: Color(0xFFED7A07)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      textColor: const Color(0xFFED7A07),
                      onPressed: () {
                        // هنا يتم تحويل المستخدم إلى شاشة تسجيل الدخول.
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login()));
                      },
                      color: Colors.white,
                      child: Text(
                        'bottom2'.tr, // نص الزر مترجم باستخدام GetX.
                        style: TextStyle(
                          fontSize: 21.18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
