import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Model/Login/User_model.dart';
import 'package:getx_mvvm/Repositories/login_repository.dart';
import 'package:getx_mvvm/Resources/Routes/Route_names.dart';
import 'package:getx_mvvm/Resources/Routes/Routes.dart';
import 'package:getx_mvvm/Utils/utils.dart';
import 'package:getx_mvvm/View_models/Controllers/User_prefrences/User_prefrences.dart';

import '../../../View/Home/Homescreen.dart';

// class EmailController extends GetxController {
//   final email = ''.obs;

// }

class Login_view_model extends GetxController {
  final email_controller = TextEditingController().obs;
  final password_controller = TextEditingController().obs;

  final emailfoucsnode = FocusNode().obs;
  final passwordfocusnode = FocusNode().obs;
  final _api = loginRepository();

  UserPrefrences userprefrence = UserPrefrences();

  bool isValidEmail(v) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(v);
  }

  RxBool loading = false.obs;
// api usage in the login screen
  void loginApi() {
    loading.value = true;
    // the date which will be sent to the function
    Map data = {
      'email': email_controller.value.text,
      'password': password_controller.value.text,
    };

    _api.loginApi(data).then((value) {
      loading.value = false;

      if (value['error'] == 'user not found') {
        Utils.snackbar("title", "user not found");
      } else {
        //setting data manually
        UserModel usermodel = UserModel(islogin: true, token: value['token']);

        userprefrence.saveuser(usermodel).then((value) {
          // TODO: implement dispose
          Get.delete<Login_view_model>();
          Get.delete<suffixcontroller>();

          //  print(value);
          if (RouteNames.Homescreen != null) {
            Get.toNamed(RouteNames.Homescreen);
          } else {
            // Handle the case where the route is null
            // all these texts will be added in languages in the localization
            return Text('Error: RouteNames.LoginScreen is null');
          }
        }).onError((error, stackTrace) {});
        Utils.snackbar("Login succesfull", "successfully");
      }
    }).onError(((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackbar("Error", error.toString());
    }));
  }
}

class suffixcontroller extends GetxController {
  RxBool passwordVisible = false.obs;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
    print(passwordVisible.value);
  }

  // Showpassword(bool value) {
  // passwordVisible.value = value;
  // }

}
