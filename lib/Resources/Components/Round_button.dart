import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_mvvm/Resources/colors/App_colors.dart';

class Roundbutton extends StatelessWidget {
  const Roundbutton(
      {Key? key,
      this.buttoncolor = Appcolor.tButtonColor,
      this.textcolor = Appcolor.TextColor,
      required this.title,
      required this.onpress,
      required this.radius,
      this.width = 60,
      this.height = 60,
      this.textSize = 16,
      this.loading = false});

  final bool loading;
  final String title;
  final double radius;
  final double height, width;
  final VoidCallback onpress;
  final double textSize;

  final Color textcolor, buttoncolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttoncolor, borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textcolor, fontSize: textSize),
                ),
        ),
      ),
    );
  }
}
