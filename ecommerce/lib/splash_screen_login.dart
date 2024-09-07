import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

class SplashScreenLogin extends StatelessWidget {
  const SplashScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Login(),
      splash: 'assets/images/splashscreen.gif',
      duration: 1000,
      splashIconSize: 700,
    );
  }
}
