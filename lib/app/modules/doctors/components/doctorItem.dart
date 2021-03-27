import 'package:careve/app/components/appButton.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';

class DoctorItem extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final double rate;
  final String id;

  DoctorItem({
    this.name,
    this.specialty,
    this.image,
    this.rate,
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
          borderRadius: AppUtil.borderRadius25,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 32.0,
                backgroundImage: AssetImage(image),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 34.sp,
                  color: ColorUtil.blackColor,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                specialty,
                style: TextStyle(
                  fontSize: 28.sp,
                  color: ColorUtil.mediumGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RatingBar(
                rating: 4,
                icon: Icon(
                  Icons.star,
                  size: 12,
                  color: Colors.grey,
                ),
                starCount: 5,
                spacing: 2.0,
                size: 3,
                isIndicator: false,
                allowHalfRating: true,
                onRatingCallback:
                    (double value, ValueNotifier<bool> isIndicator) {
                  print('Number of stars-->  $value');
                  isIndicator.value = true;
                },
                color: Colors.amber,
              ),
              Spacer(),
              SizedBox(
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        'Book',
                        textColor: ColorUtil.primaryColor,
                        borderColor: ColorUtil.primaryColor,
                        backgroundColor: Colors.transparent,
                        fontSize: 12.0,
                        onTap: () => Get.toNamed(Routes.DOCTOR_APPOINMENT),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: AppButton(
                        'Chat',
                        textColor: ColorUtil.primaryColor,
                        borderColor: ColorUtil.primaryColor,
                        backgroundColor: Colors.transparent,
                        fontSize: 12.0,
                        onTap: () {},
                      ),
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
