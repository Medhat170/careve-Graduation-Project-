import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String image;
  final String id;

  const PatientCard({
    this.name,
    this.image,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.MEDICAL_RECORDS,
        arguments: id,
      ),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: AppUtil.borderRadius25,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  image,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  name ?? '',
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: ColorUtil.blackColor,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
