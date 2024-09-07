import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/apptheme.dart';

class CustomButtonCoubon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoubon(
      {super.key, required this.textbutton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 45,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
