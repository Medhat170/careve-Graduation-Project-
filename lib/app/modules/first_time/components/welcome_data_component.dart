import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeDataComponent extends StatelessWidget {
  final String text;
  final String image;

  const WelcomeDataComponent({
    this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          child: Text(
            text ?? '',
            softWrap: true,
            style: TextStyle(
              fontSize: 60.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
