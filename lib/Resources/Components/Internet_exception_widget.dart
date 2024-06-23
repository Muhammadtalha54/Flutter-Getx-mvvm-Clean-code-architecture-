import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getx_mvvm/Resources/getx_localization/Languages.dart';
import 'package:getx_mvvm/Resources/colors/App_colors.dart';

class Internet_exception_widget extends StatefulWidget {
  const Internet_exception_widget({super.key});

  @override
  State<Internet_exception_widget> createState() =>
      _Internet_exception_widgetState();
}

class _Internet_exception_widgetState extends State<Internet_exception_widget> {
  @override
  var height, width;
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolor.YellowColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.cloud_off_outlined,
              color: Appcolor.ExceptionIconColor,
              size: 50,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: Container(
              height: height! * 0.2,
              width: width! * 0.7,
              child: Center(
                child: Text(
                  'Internet_Exception'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Appcolor.TextColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: height! * 0.05,
            width: width! * 0.2,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Retry",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
