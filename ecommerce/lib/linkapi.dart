class AppLink {
  static const String server =
      "https://trendmarkett.000webhostapp.com/ecommerce";
  static const String imagestatic =
      "https://trendmarkett.000webhostapp.com/ecommerce/upload";
  ///////////Image=================================
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";
  //========================================
  ///////////////// test /////////////////
  static const String test = "$server/test.php";
  ////////----Auth----////////
  static const String signUp = "$server/auth/signup.php";
  static const String Login = "$server/auth/login.php";
  static const String VerfiyCodeSignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
  ////////----Forget Password----////////
  static const String Checkemail = "$server/forgetpassword/checkemail.php";
  static const String Verifycode = "$server/forgetpassword/verifycode.php";
  static const String Resetpassword =
      "$server/forgetpassword/resetpassword.php";
  ////////////////////  Home /////////////
  static const String homePage = "$server/home.php";
  /////////// items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";

// Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

// Cart
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";
  // Address
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressView = "$server/address/view.php";
  /////// Coupon
  static const String checkCoupon = "$server/coupon/checkcoupon.php";
  /////// orders Checkout
  static const String ordersCheckout = "$server/orders/checkout.php";
}
