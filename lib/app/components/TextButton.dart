import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Function function;
  final Color textColor;

  CustomTextButton({
    @required this.text,
    @required this.backgroundColor,
    @required this.function,
    @required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(
            color: Color(0xFFFF4493),
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'fonts/Segoe UI Bold.ttf',
          ),
        ),
      ),
    );
  }
}
