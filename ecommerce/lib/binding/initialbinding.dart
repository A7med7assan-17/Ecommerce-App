import 'package:ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

// ده الكلاس بتاع إعدادات الربط الأولية في التطبيق.
class InitialBindings extends Bindings {
  
  // الدالة دي بتتعرف علشان نحدد الاعتماديات اللي هنحتاجها في التطبيق.
  @override
  void dependencies() {
    // هنا، بنضيف اعتمادية لكائن من نوع Crud() بواسطة Get.put().
    // يعني إننا هنخلي Crud() singleton ونديها لأي حد يحتاجها.
    Get.put(Crud());
  }
}

