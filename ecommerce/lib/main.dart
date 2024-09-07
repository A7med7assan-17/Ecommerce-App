import 'package:ecommerce/binding/initialbinding.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/transaltion.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTransaction(),
      debugShowCheckedModeBanner: false,
      title: 'Trend Market',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
// flutter build apk --release
// flutter run --release







