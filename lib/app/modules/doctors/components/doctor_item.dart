import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';

class DoctorItem extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final int raters;
  final int rate;
  final int id;

  const DoctorItem({
    this.name,
    this.specialty,
    this.image,
    this.rate,
    this.raters,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.SINGLE_DOCTOR),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: AppUtil.borderRadius,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: image != null && image.isNotEmpty
                      ? NetImage(
                          image,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          PathUtil.userImage,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: ColorUtil.blackColor,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Text(
                    //   specialty ?? '',
                    //   style: TextStyle(
                    //     fontSize: 34.sp,
                    //     color: ColorUtil.mediumGrey,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    if (rate != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar(
                            rating: double.tryParse(rate.toString()),
                            icon: const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.grey,
                            ),
                            spacing: 5.0,
                            size: 3,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            '(${raters ?? 0})',
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: ColorUtil.mediumGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
