import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorHintCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtil.primaryColor,
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
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
        child: Row(
          children: [
            Image.asset(
              PathUtil.worriedWomanImage,
              height: 300.h,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).worried,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 46.sp,
                      color: ColorUtil.whiteColor,
                    ),
                  ),
                  Text(
                    S.of(context).doctorHint,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp,
                      color: ColorUtil.whiteColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        title: S.of(context).findDoctor,
                        backgroundColor: ColorUtil.whiteColor,
                        height: 80.w,
                        width: 300.w,
                        textColor: ColorUtil.primaryColor,
                        onTap: () => Get.toNamed(Routes.DOCTORS),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
