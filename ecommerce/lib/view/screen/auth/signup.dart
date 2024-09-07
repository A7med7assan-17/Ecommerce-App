// ignore_for_file: deprecated_member_use

import 'package:ecommerce/controllear/auth/signup_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/screen/auth/custombuttomauth.dart';
import 'package:ecommerce/view/screen/auth/customdescriptionforauth.dart';
import 'package:ecommerce/view/screen/auth/customimageauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleforauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'sign_up'.tr,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 47),
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
                        description: 'signup_des'.tr,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "username");
                        },
                        hintText: 'user_name'.tr,
                        icondata: Iconsax.profile_circle,
                        mycontroller: controller.username,
                        isNumber: false,
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
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 11, 30, "phone");
                        },
                        hintText: 'enter_your_phone'.tr,
                        icondata: Iconsax.call,
                        mycontroller: controller.phone,
                        isNumber: true,
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 6, 100, "password");
                          },
                          onTapIcon: () {
                            controller.showpass();
                          },
                          hintText: 'password'.tr,
                          icondata: Iconsax.security_safe,
                          icondataPass: controller.isshowpass == true
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                          mycontroller: controller.password,
                          isNumber: false,
                          obscureText: controller.isshowpass,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButtonAuth(
                        text: 'signup_button'.tr,
                        onPressed: () {
                          controller.signUp();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("have_an_account".tr),
                          SizedBox(width: 3),
                          InkWell(
                            onTap: () {
                              controller.goToLogin();
                            },
                            child: Text(
                              "sign_in_des".tr,
                              style: TextStyle(color: Color(0xFFED7A07)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

