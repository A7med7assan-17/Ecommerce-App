import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/data/model/onboardingmodel.dart';
import 'package:get/get.dart';

// قائمة تحتوي على موديلات الشرائح لشاشة OnBoarding.
List<OnBoardingModel> onBoardingList = [
  // موديل الشريحة الأولى.
  OnBoardingModel(
    image: ImageAsset.f1, // الصورة المرتبطة بالشريحة.
    title: 'page1_title'.tr, // عنوان الشريحة.
    body: 'page1_description'.tr, // وصف الشريحة.
  ),
  // موديل الشريحة الثانية.
  OnBoardingModel(
    image: ImageAsset.f2, // الصورة المرتبطة بالشريحة.
    title: 'page2_title'.tr, // عنوان الشريحة.
    body: 'page2_description'.tr, // وصف الشريحة.
  ),
  // موديل الشريحة الثالثة.
  OnBoardingModel(
    image: ImageAsset.f3, // الصورة المرتبطة بالشريحة.
    title: 'page3_title'.tr, // عنوان الشريحة.
    body: 'page3_description'.tr, // وصف الشريحة.
  ),
];
