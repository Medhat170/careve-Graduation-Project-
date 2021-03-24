import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final Function onTap;
  final Color textColor;
  final String imagePath;
  final double elevation;
  final EdgeInsets margin;

  AppButton(
    this.title, {
    @required this.onTap,
    this.elevation = 6.5,
    this.backgroundColor = ColorUtil.primaryColor,
    this.margin,
    this.borderColor,
    this.textColor,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      title ?? '',
      style: TextStyle(
        color: textColor ?? ColorUtil.whiteColor,
        fontWeight: imagePath != null ? FontWeight.w500 : FontWeight.bold,
        fontSize: 18,
      ),
    );

    final buttonStyle = TextButton.styleFrom(
      elevation: elevation,
      shadowColor: backgroundColor.withOpacity(0.5),
      side: BorderSide(
        color: borderColor ?? Colors.transparent,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppUtil.borderRadius,
      ),
      backgroundColor: backgroundColor,
    );
    void onPressed() {
      FocusScope.of(context).requestFocus(new FocusNode());
      onTap();
    }

    return Container(
      margin: margin,
      width: Get.width,
      height: 50,
      child: imagePath != null
          ? TextButton.icon(
              onPressed: onPressed,
              icon: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
              label: textWidget,
              style: buttonStyle,
            )
          : TextButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: textWidget,
            ),
    );
  }
}
