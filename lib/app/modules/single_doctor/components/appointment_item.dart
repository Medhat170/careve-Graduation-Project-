import 'package:careve/app/utilities/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/utilities/color_util.dart';
import '../../../components/extensions.dart';

class AppointmentItem extends StatelessWidget {
  final DateTime date;

  const AppointmentItem({
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.5,
      color: ColorUtil.lightGrey,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppUtil.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              color: ColorUtil.primaryColor,
              size: 24.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(
                date.toTimeOnly(),
                style: TextStyle(
                  color: ColorUtil.blackColor,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorUtil.primaryColor,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
