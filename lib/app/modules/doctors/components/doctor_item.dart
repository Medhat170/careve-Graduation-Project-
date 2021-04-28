import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorItem extends StatelessWidget {
  final Doctor doctor;

  const DoctorItem({
    @required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.SINGLE_DOCTOR, arguments: doctor),
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
                  child: doctor?.image != null && doctor.image.isNotEmpty
                      ? NetImage(
                          doctor?.image,
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
                      doctor?.name ?? '',
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
                    if (doctor?.rating != null)
                      Row(
                        children: [
                          SmoothStarRating(
                            allowHalfRating: false,
                            rating: double.tryParse(
                                doctor?.rating?.toString() ?? '0'),
                            size: 12.0,
                            isReadOnly: true,
                            color: Colors.amber,
                            borderColor: ColorUtil.mediumGrey,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '( ${doctor?.raters ?? 0} )',
                            style: TextStyle(
                              fontSize: 32.sp,
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
