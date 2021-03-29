import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepTextStyle extends StatelessWidget {
  final String stepContent;
  StepTextStyle({
    @required this.stepContent,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      stepContent,
      style: TextStyle(
        color: ColorUtil.blackColor,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
//      softWrap: true,
    );
  }
}
