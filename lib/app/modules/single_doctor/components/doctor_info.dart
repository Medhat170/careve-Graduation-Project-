import 'package:careve/app/components/appButton.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfo extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final double rate;
  final String id;

  DoctorInfo({
    this.name,
    this.specialty,
    this.image,
    this.rate,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppUtil.borderRadius25,
              child: Image.asset(
                PathUtil.nearbyHospitalsImage,
                fit: BoxFit.cover,
                width: Get.width * 0.35,
                height: double.infinity,
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
                      fontSize: 56.sp,
                      color: ColorUtil.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    specialty ?? '',
                    style: TextStyle(
                      fontSize: 46.sp,
                      color: ColorUtil.mediumGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  if (rate != null)
                    RatingBar(
                      rating: rate,
                      icon: Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.grey,
                      ),
                      starCount: 5,
                      spacing: 2.0,
                      size: 5,
                      isIndicator: false,
                      allowHalfRating: true,
                      onRatingCallback:
                          (double value, ValueNotifier<bool> isIndicator) {
                        print('Number of stars-->  $value');
                        isIndicator.value = true;
                      },
                      color: Colors.amber,
                    ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            '',
                            backgroundColor: ColorUtil.whiteColor,
                            iconData: FontAwesomeIcons.facebookMessenger,
                            size: 20.0,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 7.5,
                        ),
                        Expanded(
                          child: AppButton(
                            '',
                            backgroundColor: ColorUtil.whiteColor,
                            imagePath: PathUtil.googleIcon,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 7.5,
                        ),
                        Expanded(
                          child: AppButton(
                            '',
                            backgroundColor: ColorUtil.whiteColor,
                            imagePath: PathUtil.googleIcon,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
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
