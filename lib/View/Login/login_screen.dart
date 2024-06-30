import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Components/Round_button.dart';
import 'package:getx_mvvm/Resources/Routes/Route_names.dart';
import 'package:getx_mvvm/Resources/getx_localization/Languages.dart';

import '../../View_models/Controllers/Login/logincontroller.dart';
import '../../Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginview = Get.put(Login_view_model());
  final suffixcontroller suffixcontrol = Get.put(suffixcontroller());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Utils.snackbar("Rebuilded", "page rebuilded");
    if (kDebugMode == true) {
      print("the widget is builed again again again");
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text('Logintitle'.tr),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('English'),
                  value: 'item1',
                ),
                PopupMenuItem(
                  child: Text('Urdu'),
                  value: 'item2',
                ),
                PopupMenuItem(
                  child: Text('Japanese'),
                  value: 'item3',
                ),
                PopupMenuItem(
                  child: Text('Chinese'),
                  value: 'item4',
                ),
                PopupMenuItem(
                  child: Text('Hindi'),
                  value: 'item5',
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 'item1':
                  Get.updateLocale(Locale('en', 'US'));
                  break;
                case 'item2':
                  Get.updateLocale(Locale('ur', 'PK'));
                  break;
                case 'item3':
                  Get.updateLocale(Locale('ja', 'JP'));
                  break;
                case 'item4':
                  Get.updateLocale(Locale('zh', 'CN'));
                  break;
                case 'item5':
                  Get.updateLocale(Locale('hi', 'IN'));
                  break;
                default:
                  Get.updateLocale(Locale('en', 'US'));

                  break;
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.07,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  controller: loginview.email_controller.value,
                  focusNode: loginview.emailfoucsnode.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'hint1'.tr,
                  ),

                  validator: (value) {
                    // Check if this field is empty
                    if (value == null || value.isEmpty) {
                      return 'Email Required';
                    }

                    // using regular expression
                    if (!loginview.isValidEmail(value)) {
                      return "Please enter a valid email address";
                    }

                    // the email is valid
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context,
                        loginview.emailfoucsnode.value,
                        loginview.passwordfocusnode.value);
                  },

                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,

                  // email will be validated by a button and making a fuction for conditions
                ),
              ),
              Container(
                height: Get.height * 0.07,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Obx(
                  () => TextFormField(
                    controller: loginview.password_controller.value,
                    focusNode: loginview.passwordfocusnode.value,
                    obscureText: !suffixcontrol.passwordVisible.value,
                    decoration: InputDecoration(
                        hintText: 'hint2'.tr,
                        border: OutlineInputBorder(),
                        suffixIcon:
                            //  Obx(
                            // () =>
                            InkWell(
                          onTap: () {
                            suffixcontrol.togglePasswordVisibility();
                          },
                          child: Icon(
                            suffixcontrol.passwordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          // ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password required';
                      }
                      if (value.length < 7) {
                        return 'Must be more than 6 charater';
                      }
                      // if (!RegExp(
                      //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      //     .hasMatch(text)) {
                      //   return "Please enter a valid password";
                      // }
                      return null;
                    },
                  ),
                ),
              ),
              Obx(
                () => InkWell(
                  onLongPress: () {
                    Utils.snackbar('snackbar_title'.tr, 'snackbar_message'.tr);
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Roundbutton(
                        height: Get.height * 0.07,
                        width: Get.width * 0.4,
                        textSize: 20,
                        loading: loginview.loading.value,
                        title: 'btn_text'.tr,
                        onpress: () {
                          if (formkey.currentState!.validate()) {
                            loginview.loginApi();
                            
                          } else {
                            Utils.Toastmessage("hi");
                          } //
                        },
                        radius: 10),
                  ),
                ),
              )

              // ElevatedButton(
              //     onLongPress: () {
              //       Utils.snackbar('snackbar_title'.tr, 'snackbar_message'.tr);
              //     },
              //     onPressed: () {
              //
              //     },
              //     child: Text('btn_text'.tr))
            ],
          ),
        ),
      ),
    );
  }
}
