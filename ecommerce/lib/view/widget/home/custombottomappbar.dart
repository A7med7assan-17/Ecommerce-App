import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Function()? onPressed;
  final String textbottom;
  final IconData icondata;
  final bool? active;

  const CustomBottomAppBar({
    super.key,
    this.onPressed,
    required this.textbottom,
    required this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true ? AppColor.primaryColor : Colors.grey),
        Text(
          textbottom,
          style: TextStyle(
              color: active == true ? AppColor.primaryColor : Colors.grey),
        ),
      ]),
    );
  }
}
