import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SectionItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final Function onTap;

  SectionItem({
    this.id,
    this.title,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
