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

  SectionItem({
    this.id,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ARTICLES),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: AppUtil.borderRadius,
              color: ColorUtil.transparentPink,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: AppUtil.borderRadius,
              color: ColorUtil.transparentPink,
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 10.0,
            right: 10.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 46.sp,
                  color: ColorUtil.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
