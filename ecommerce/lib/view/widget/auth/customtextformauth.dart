import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final IconData icondata;
  final IconData? icondataPass;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.icondata,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
    this.icondataPass,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13, fontFamily: 'Poppins'),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 35),
          prefixIcon: Icon(icondata),
          suffixIcon: InkWell(
            child: Icon(icondataPass),
            onTap: onTapIcon,
          ),
        ),
      ),
    );
  }
}






