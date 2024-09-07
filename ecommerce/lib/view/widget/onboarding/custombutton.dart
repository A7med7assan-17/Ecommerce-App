import 'package:ecommerce/controllear/onboarding_controlar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الكلاس الذي يُستخدم لعرض زر مخصص في شاشة OnBoarding.
class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    // بنية الزر المخصص.
    return Container(
      height: 45,
      width: 238,
      child: MaterialButton(
        // تحديد شكل الحواف للزر.
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        // تحديد لون النص.
        textColor: Colors.white,
        // دالة التفاعل عند الضغط على الزر.
        onPressed: () {
          controller.next(); // استدعاء دالة للانتقال إلى الشريحة التالية.
        },
        // تحديد لون الخلفية للزر.
        color: const Color(0xFFED7A07),
        // عرض نص الزر مع ترجمته باستخدام GetX.
        child: Text(
          "bottom1".tr,
          style: TextStyle(
            fontSize: 21.18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
