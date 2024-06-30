import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Routes/Route_names.dart';
import 'package:getx_mvvm/View_models/Controllers/User_prefrences/User_prefrences.dart';

class SplashServices {
  UserPrefrences userPrefrence = UserPrefrences();
  void isLogin() {
    userPrefrence.getuser().then((value) {
      if (value.islogin==false || value.islogin.toString()== 'null') {
        Timer(
          const Duration(seconds: 3),
          () {
            // Ensure RouteNames.LoginScreen is not null
            if (RouteNames.LoginScreen != null) {
              Get.toNamed(RouteNames.LoginScreen);
            } else {
              // Handle the case where the route is null
              print('Error: RouteNames.LoginScreen is null');
            }
          },
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () {
            // Ensure RouteNames.LoginScreen is not null
            if (RouteNames.Homescreen != null) {
              Get.toNamed(RouteNames.Homescreen);
            } else {
              // Handle the case where the route is null
              print('Error: RouteNames.LoginScreen is null');
            }
          },
        );
      }
    });
  }
}
