import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: CircleAvatar(
            backgroundColor: ColorUtil.lightGrey,
            radius: 22.0,
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 22.0,
                color: ColorUtil.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
