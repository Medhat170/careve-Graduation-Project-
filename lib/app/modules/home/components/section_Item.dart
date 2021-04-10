import 'package:careve/app/components/badge.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionItem extends StatelessWidget {
  final String title;
  final String image;
  final int notification;
  final Function onTap;

  SectionItem({
    this.notification,
    this.title,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      title: notification?.toString(),
      top: 5.0,
      right: 5.0,
      radius: 14.0,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: ColorUtil.whiteColor,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: AppUtil.borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 46.sp,
                    color: ColorUtil.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
