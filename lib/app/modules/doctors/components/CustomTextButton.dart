import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function function;
  CustomTextButton({this.title, this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.sp,
      height: 80.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(color: ColorUtil.primaryColor),
        ),
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 30.sp,
            color: ColorUtil.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
