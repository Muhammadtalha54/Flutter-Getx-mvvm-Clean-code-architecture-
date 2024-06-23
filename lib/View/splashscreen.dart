import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Resources/Assets/images._assets.dart';
import 'package:getx_mvvm/Resources/Components/Internet_exception_widget.dart';
import 'package:getx_mvvm/Resources/Components/Round_button.dart';
import 'package:getx_mvvm/Resources/colors/App_colors.dart';
import 'package:getx_mvvm/View/Login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text("title"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Appcolor.tButtonColor,
              ),
            )
          ],
        ),
        width: Get.width * 0.6,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.6,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageAssets.image1))),
            child: Internet_exception_widget(),
          ),
          Center(
              child: InkWell(
            onTap: () {
              Get.to(LoginScreen(),
                  transition: Transition.leftToRight,
                  duration: Duration(seconds: 5));
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Roundbutton(
                height: 50,
                width: 200,
                radius: 60,
                title: 'mainbutton'.tr,
                onpress: () {
                  Get.to(LoginScreen());
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}
