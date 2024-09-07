import 'package:ecommerce/controllear/onboarding_controlar.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الكلاس الذي يمثل عنصر التحكم بالنقاط في شاشة OnBoarding.
class CustomDotControlarOnBordering extends StatelessWidget {
  const CustomDotControlarOnBordering({super.key});

  @override
  Widget build(BuildContext context) {
    // دالة GetBuilder تساعد في إعادة بناء الواجهة عندما يتغير حالة الكنترولر.
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              // توضيح المحور الرئيسي للصف منتصف الشاشة.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // استخدام List.generate لإنشاء عناصر التحكم بالنقاط بناءً على عدد الشرائح.
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          // تحديث عرض العنصر بناءً على الشريحة الحالية.
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                            // تحديد لون النقطة المختارة أو غير المختارة.
                            color: const Color(0xFFED7A07),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
              ],
            ));
  }
}
