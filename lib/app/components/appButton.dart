import 'dart:ffi';

import 'package:careve/app/components/AppButton.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareveButton extends AppButton {
  CareveButton(String title) : super(title);
}

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final Function onTap;
  final Color textColor;
  final Color iconColor;
  final String imagePath;
  final double elevation;
  final EdgeInsets margin;
  final double fontSize;
  final IconData iconData;
  final double size;

  AppButton(
    this.title, {
    @required this.onTap,
    this.iconData,
    this.fontSize = 18,
    this.size = 40.0,
    this.elevation = 6.5,
    this.backgroundColor = ColorUtil.primaryColor,
    this.iconColor = ColorUtil.primaryColor,
    this.margin,
    this.borderColor,
    this.textColor,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    final textWidget = Text(
      title ?? '',
      style: TextStyle(
        color: textColor ?? ColorUtil.whiteColor,
        fontWeight: imagePath != null || iconData != null
            ? FontWeight.w500
            : FontWeight.bold,
        fontSize: fontSize,
      ),
    );

    final buttonStyle = TextButton.styleFrom(
      elevation: backgroundColor == Colors.transparent ? 0.0 : elevation,
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

    final image = imagePath == null
        ? null
        : Image.asset(
            imagePath,
            width: size,
            height: size,
          );
    final icon = iconData == null
        ? null
        : Icon(
            iconData,
            size: size,
            color: iconColor,
          );
    if ((imagePath != null || iconData != null) && title == null) {
      child = Card();
    } else if ((imagePath != null || iconData != null) && title != null) {
      child = TextButton.icon(
        onPressed: onPressed,
        icon: image ?? icon,
        label: textWidget,
        style: buttonStyle,
      );
    } else {
      child = TextButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: textWidget,
      );
    }
    return Container(
      margin: margin,
      width: Get.width,
      height: 50,
      child: child,
    );
  }
}
