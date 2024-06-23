import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:getx_mvvm/Resources/Routes/Routes.dart';
import 'package:getx_mvvm/Resources/getx_localization/Languages.dart';
import 'package:getx_mvvm/View/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('en', 'US'),

      ///if any lanuage is not selected fallback is by default language
      fallbackLocale: Locale('en', 'US'),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Splashscreen(),
      getPages: AppRoutes.routes(),
    );
  }
}
