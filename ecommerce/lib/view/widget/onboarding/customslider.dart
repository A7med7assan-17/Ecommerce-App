import 'package:ecommerce/controllear/onboarding_controlar.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الكلاس الذي يُستخدم لعرض الشرائح في شاشة OnBoarding.
class SliderOnBoardring extends GetView<OnBoardingControllerImp> {
  const SliderOnBoardring({super.key});

  @override
  Widget build(BuildContext context) {
    // عرض الشرائح في صفحات متعددة.
    return PageView.builder(
      controller:
          controller.pageController, // استخدام الكنترولر للتنقل بين الشرائح.
      onPageChanged: (val) {
        controller.onPageChanged(val); // تغيير الصفحة النشطة في الكنترولر.
      },
      itemCount: onBoardingList.length, // عدد الشرائح.
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(height: 15),
          // عرض صورة الشريحة.
          Image.asset(onBoardingList[i].image!, width: 328, height: 328),
          SizedBox(height: 8.5),
          // عرض عنوان الشريحة.
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 25),
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            // عرض نص الشريحة.
            child: Text(onBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(90, 0, 0, 0),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
