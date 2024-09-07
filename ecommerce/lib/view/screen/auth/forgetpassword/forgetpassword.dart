import 'package:ecommerce/controllear/forgetpasswordcontroller/forgetpassword_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/screen/auth/custombuttomauth.dart';
import 'package:ecommerce/view/screen/auth/customdescriptionforauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleforauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'reset_password'.tr,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    Container(
                        width: 359,
                        height: 361,
                        child: Image.asset('assets/images/ForgotPassword.png')),
                    CustomTilteForAuth(
                      title: 'check_email'.tr,
                    ),
                    const SizedBox(height: 10),
                    CustomDescriptionForAuth(
                      description: 'signup_des'.tr,
                    ),
                    SizedBox(
                      height: 35,
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
                    SizedBox(height: 20),
                    CustomButtonAuth(
                      text: 'check'.tr,
                      onPressed: () {
                        controller.checkemail();
                      },
                    ),
                  ]),
                ),
              ))),
    );
  }
}
