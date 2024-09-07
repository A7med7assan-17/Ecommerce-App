import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/splash_screen_home.dart';
import 'package:ecommerce/splash_screen_login.dart';
import 'package:ecommerce/view/address/add.dart';
import 'package:ecommerce/view/address/view.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce/view/screen/auth/verfiycodesignup.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(
      name: "/",
      page: () => AnimatedSplashScreen(
            nextScreen: Language(),
            splash: 'assets/images/splashscreen.gif',
            duration: 1000,
            splashIconSize: 700,
          ),
      middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.SignUp, page: () => const SignUp()),
  GetPage(name: AppRoute.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VerfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.ResetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.SuccessSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.SuccessResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.VerfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  // OnBoarding
  GetPage(name: AppRoute.HomePage, page: () => const HomeScreen()),
  GetPage(
      name: AppRoute.splashScreenLogin, page: () => const SplashScreenLogin()),
  GetPage(
      name: AppRoute.splashScreenHome, page: () => const SplashScreenHome()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.Items, page: () => const Items()),
  GetPage(name: AppRoute.productDetils, page: () => ProductDetails()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.myfavorite, page: () => MyFavorite()),
  GetPage(name: AppRoute.addressView, page: () => AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => CheckOut()),
];
