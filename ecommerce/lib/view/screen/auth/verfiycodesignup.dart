import 'package:ecommerce/controllear/auth/verfiycode_signupcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/view/screen/auth/customdescriptionforauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleforauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'VerificationCode'.tr,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
              child: ListView(
                children: [
                  Container(
                      width: 359,
                      height: 361,
                      child: Image.asset('assets/images/EnterOTP.png')),
                  CustomTilteForAuth(
                    title: 'check_code'.tr,
                  ),
                  SizedBox(height: 10),
                  CustomDescriptionForAuth(
                    description: 'verifiy_des'.tr,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  OtpTextField(
                    fieldWidth: 45,
                    borderRadius: BorderRadius.circular(50),
                    focusedBorderColor: Color(0xFFED7A07),
                    numberOfFields: 5,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    },
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Center(
                        child: Text(
                      "resend".tr,
                      style:
                          TextStyle(color: AppColor.primaryColor, fontSize: 18),
                    )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
