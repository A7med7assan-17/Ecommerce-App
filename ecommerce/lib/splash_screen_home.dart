import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreenHome extends StatelessWidget {
  const SplashScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: HomeScreen(),
      splash: 'assets/images/splashscreen.gif',
      duration: 1000,
      splashIconSize: 700,
    );
  }
}
