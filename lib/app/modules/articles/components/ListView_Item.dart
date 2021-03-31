import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewItem extends StatelessWidget {
  final String image;
  final String question;
  ListViewItem({
    this.image,
    this.question,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage(image),
        ),
        Container(
          width: 200,
          height: 50,
          child: Text(
            question,
            softWrap: true,
            style: TextStyle(
              color: ColorUtil.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 40.sp,
            ),
          ),
        )
      ],
    );
  }
}
