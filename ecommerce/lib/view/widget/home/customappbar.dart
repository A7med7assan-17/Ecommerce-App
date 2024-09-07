import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFav;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppBar({
    super.key,
    required this.titleappbar,
    required this.onPressedIconFav,
    this.onPressedSearch,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  icon: Icon(Iconsax.search_normal),
                  onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: TextStyle(
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(50)),
          width: 55,
          padding: EdgeInsets.symmetric(vertical: 4),
          child: IconButton(
            onPressed: onPressedIconFav,
            icon: Icon(
              Iconsax.heart,
              size: 30,
            ),
          ),
        ),
      ]),
    );
  }
}
