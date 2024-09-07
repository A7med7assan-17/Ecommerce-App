import 'package:ecommerce/controllear/forgetpasswordcontroller/success_resetpassword_controller.dart';
import 'package:ecommerce/view/screen/auth/custombuttomauth.dart';
import 'package:ecommerce/view/screen/auth/customdescriptionforauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleforauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Success',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          ),
        ),
        body: GetBuilder<SuccessResetPasswordControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Container(
                width: 359,
                height: 361,
                child: Image.asset('assets/images/Success.png'),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTilteForAuth(
                title: 'Congratulations'.tr,
              ),
              SizedBox(height: 10),
              CustomDescriptionForAuth(
                description: 'Success_des'.tr,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: 'goToLogin'.tr,
                  onPressed: () {
                    controller.goToLogin();
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
