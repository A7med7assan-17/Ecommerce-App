import 'package:ecommerce/controllear/forgetpasswordcontroller/resetpassword_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/screen/auth/custombuttomauth.dart';
import 'package:ecommerce/view/screen/auth/customdescriptionforauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleforauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'resetpassword'.tr,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 47),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      Container(
                          width: 359,
                          height: 361,
                          child:
                              Image.asset('assets/images/ResetPassword.png')),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTilteForAuth(
                        title: 'newpass'.tr,
                      ),
                      SizedBox(height: 10),
                      CustomDescriptionForAuth(
                        description: 'reset_des'.tr,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      GetBuilder<ResetPasswordControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 6, 20, "password");
                          },
                          onTapIcon: () {
                            controller.showpass();
                          },
                          hintText: 'password'.tr,
                          icondata: Iconsax.security_safe,
                          mycontroller: controller.password,
                          icondataPass: controller.isshowpass == true
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                          isNumber: false,
                          obscureText: controller.isshowpass,
                        ),
                      ),
                      GetBuilder<ResetPasswordControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 6, 20, "password");
                          },
                          onTapIcon: () {
                            controller.showpass();
                          },
                          hintText: 're_enter_your_password'.tr,
                          icondata: Iconsax.security_safe,
                          mycontroller: controller.repassword,
                          isNumber: false,
                          icondataPass: controller.isshowpass == true
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                          obscureText: controller.isshowpass,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButtonAuth(
                        text: 'Save'.tr,
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}