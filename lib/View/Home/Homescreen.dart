import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Routes/Route_names.dart';
import 'package:getx_mvvm/Resources/colors/App_colors.dart';
import 'package:getx_mvvm/View_models/Controllers/User_prefrences/User_prefrences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  UserPrefrences userPrefrence = UserPrefrences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      appBar: AppBar(
        title: Text("Get API Example"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                //logout and remove user from shared prefrenes
                userPrefrence.Removeuser().then((value) {
                  Get.toNamed(RouteNames.LoginScreen);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
