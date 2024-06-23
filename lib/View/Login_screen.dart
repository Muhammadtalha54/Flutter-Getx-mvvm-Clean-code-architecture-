import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/getx_localization/Languages.dart';

import '../Controllers/Textfield_controllers.dart';
import '../Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EmailController _emailController = Get.put(EmailController());
  final FocusNode _currentFocus = FocusNode();
  final FocusNode _nextFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text('ScreenTitle'.tr),
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
              child: TextField(
                focusNode: _currentFocus,
                decoration: InputDecoration(
                  labelText: 'hint1'.tr,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  _emailController.email.value = value;
                },
                // email will be validated by a button and making a fuction for conditions
                onSubmitted: (_) {
                  if (_emailController.isValidEmail) {
                    FocusScope.of(context).requestFocus(_nextFocus);
                  } else {
                    Utils.snackbar(
                      'Error' 'snackbar_title'.tr,
                      'snackbar_message'.tr,
                    );
                  }
                },
              ),
            ),
            Container(
              height: Get.height * 0.07,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                focusNode: _nextFocus,
                decoration: InputDecoration(
                  hintText: 'hint2'.tr,
                ),
              ),
            ),
            ElevatedButton(
                onLongPress: () {
                  Utils.snackbar('snackbar_title'.tr, 'snackbar_message'.tr);
                },
                onPressed: () {
                  Utils.Toastmessage("hi");
                },
                child: Text('btn_text'.tr))
          ],
        ),
      ),
    );
  }
}
