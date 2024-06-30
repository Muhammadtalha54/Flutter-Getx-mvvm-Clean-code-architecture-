import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Routes/Route_names.dart';
import 'package:getx_mvvm/View/Home/Homescreen.dart';

import 'package:getx_mvvm/View/Login/login_screen.dart';
import 'package:getx_mvvm/View/splashview/splashscreen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes() {
    return [
      GetPage(
        name: RouteNames.SplashScreen,
        page: () => Splashscreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: RouteNames.LoginScreen,
        page: () => LoginScreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
       GetPage(
        name: RouteNames.Homescreen,
        page: () => Homescreen(),
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      ),
      // Add more GetPage objects as needed
    ];
  }
}
