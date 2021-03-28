import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTextStyle extends StatelessWidget {
  final String headerContent;
  HeaderTextStyle({
    @required this.headerContent,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      headerContent,
      style: TextStyle(
        color: ColorUtil.primaryColor,
        fontSize: 35.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
