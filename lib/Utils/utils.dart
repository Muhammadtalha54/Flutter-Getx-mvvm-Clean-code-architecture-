import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/colors/App_colors.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static Toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Appcolor.YellowColor,
        gravity: ToastGravity.CENTER_RIGHT,
        textColor: Appcolor.TextColor);
  }

  static bool isValidEmail(String email) {
    // This regular expression checks for a basic email pattern.
    // You can use a more sophisticated regex for stricter validation.
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static snackbar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Appcolor.YellowColor,
        snackPosition: SnackPosition.TOP,
        animationDuration: Duration(seconds: 1));
  }
}
