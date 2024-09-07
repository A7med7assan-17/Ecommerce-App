import 'package:flutter/material.dart';

class TextSignup extends StatelessWidget {
final String textone ;
final String texttwo ;
final void Function() onTap ;

  const TextSignup({super.key, required this.textone, required this.texttwo,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textone),
                SizedBox(width: 5),
                InkWell(
                  onTap:onTap,
                  child: Text(
                    texttwo,
                    style: TextStyle(color: Color(0xFFED7A07)),
                  ),
                )
              ],
            );
  }
}