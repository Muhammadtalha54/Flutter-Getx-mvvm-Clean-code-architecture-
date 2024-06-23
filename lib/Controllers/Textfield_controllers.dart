import 'package:get/get.dart';

class EmailController extends GetxController {
  final email = ''.obs;

  bool get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.value);
}
