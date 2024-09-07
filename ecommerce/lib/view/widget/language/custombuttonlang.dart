import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 49,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Color(0xFFED7A07),
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
