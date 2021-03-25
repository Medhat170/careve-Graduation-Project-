import 'package:careve/app/modules/doctors/components/CustomTextButton.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';

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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorUtil.mediumGrey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
        color: ColorUtil.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 30.sp,
              color: ColorUtil.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            specialty,
            style: TextStyle(
              fontSize: 25.sp,
              color: ColorUtil.mediumGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          RatingBar(
            rating: 4,
            icon: Icon(
              Icons.star,
              size: 10,
              color: Colors.grey,
            ),
            starCount: 5,
            spacing: 2.0,
            size: 3,
            isIndicator: false,
            allowHalfRating: true,
            onRatingCallback: (double value, ValueNotifier<bool> isIndicator) {
              print('Number of stars-->  $value');
              isIndicator.value = true;
            },
            color: Colors.amber,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                title: 'Book',
                function: () {},
              ),
              CustomTextButton(
                title: 'Chat',
                function: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
