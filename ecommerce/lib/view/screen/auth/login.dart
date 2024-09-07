// ignore_for_file: deprecated_member_use

import 'package:ecommerce/controllear/auth/login_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/screen/auth/custombuttomauth.dart';
import 'package:ecommerce/view/screen/auth/customdescriptionforauth.dart';
import 'package:ecommerce/view/screen/auth/customimageauth.dart';
import 'package:ecommerce/view/screen/auth/textsignup.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleforauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'sign_in'.tr,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 47),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTilteForAuth(
                            title: 'welcome_back'.tr,
                          ),
                          SizedBox(height: 10),
                          CustomDescriptionForAuth(
                            description: 'sign_des'.tr,
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            hintText: 'enter_your_email'.tr,
                            icondata: Iconsax.sms,
                            mycontroller: controller.email,
                            isNumber: false,
                          ),
                          GetBuilder<LoginControllerImp>(
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
                              isNumber: false,
                              icondataPass: controller.isshowpass == true
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                              obscureText: controller.isshowpass,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              'forget_password'.tr,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomButtonAuth(
                            text: 'signin_button'.tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              SizedBox(width: 40),
                              CustomImageAuth(
                                image: 'assets/images/google.png',
                              ),
                              SizedBox(width: 25),
                              CustomImageAuth(
                                image: 'assets/images/facebook.png',
                              ),
                              SizedBox(width: 25),
                              CustomImageAuth(
                                image: 'assets/images/twitter.png',
                              ),
                              SizedBox(width: 40),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextSignup(
                            textone: "don't_have_an_account".tr,
                            texttwo: "sign_up_des".tr,
                            onTap: () {
                              controller.goToSignUp();
                            },
                          ),
                        ],
                      ),
                    ),
                  ))),
        ));
  }
}
