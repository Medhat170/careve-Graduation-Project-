import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';

class RecordCard extends StatelessWidget {
  final DateTime dateTime;
  final String title;
  final String results;
  final String image;

  const RecordCard({
    this.dateTime,
    this.title,
    this.results,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtil.whiteColor,
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppUtil.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dateTime?.toLongUserString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 46.sp,
                color: ColorUtil.mediumGrey,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Image.asset(
                  PathUtil.articlesImage,
                  height: 400.w,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 46.sp,
                          color: ColorUtil.primaryColor,
                        ),
                      ),
                      Text(
                        results,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 46.sp,
                          color: ColorUtil.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
