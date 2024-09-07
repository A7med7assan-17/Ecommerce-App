// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'package:ecommerce/controllear/address/add_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/screen/auth/custombuttomauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controller = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("AddNewAddress".tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<AddAddressController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  CustomTextFormAuth(
                      hintText: 'city'.tr,
                      icondata: Icons.location_city_outlined,
                      mycontroller: controller.city,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hintText: 'street'.tr,
                      icondata: Icons.streetview_outlined,
                      mycontroller: controller.street,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hintText: 'namelocation'.tr,
                      icondata: Icons.near_me_outlined,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomButtonAuth(
                      text: "Add".tr,
                      onPressed: () {
                        controller.addAddress();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}


