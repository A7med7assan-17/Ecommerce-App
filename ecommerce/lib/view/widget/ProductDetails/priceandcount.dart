import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  // final String discount;
  final String count;
  const PriceAndCountItems({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          price,
          style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 1.1),
        ),
        // const SizedBox(width: 5),
        // Text(
        //   discount,
        //   style: TextStyle(
        //       color: AppColor.greyColor,
        //       fontSize: 15,
        //       fontWeight: FontWeight.w600,
        //       height: 1.1,
        //       decoration: TextDecoration.lineThrough),
        // ),
        const Spacer(),
        IconButton(onPressed: onAdd, icon: Icon(Iconsax.add_square)),
        Container(
            child: Text(
          count,
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1.1),
        )),
        IconButton(
            onPressed: onRemove,
            icon: Icon(
              Iconsax.minus_square,
            )),
      ],
    );
  }
}
