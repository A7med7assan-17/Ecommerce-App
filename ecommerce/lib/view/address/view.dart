// ignore_for_file: unused_local_variable

import 'package:ecommerce/controllear/address/view_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text("MyAddress".tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAdd);
        },
        child: Icon(
          Iconsax.add,
          size: 35,
          color: Colors.white,
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<AddressViewController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (contex, i) {
                  return CardAddress(
                    addressModel: controller.data[i],
                    onDelete: () {
                      controller.deleteAddress(controller.data[i].addressId!);
                    },
                  );
                },
              ),
            ),
          )),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListTile(
          title: Text(
            "${addressModel.addressName!}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "${addressModel.addressCity!}  ${addressModel.addressStreet!}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(
                Iconsax.trash,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}



