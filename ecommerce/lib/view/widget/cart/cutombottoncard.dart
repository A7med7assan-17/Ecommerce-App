import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/apptheme.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.textbutton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: 170,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
