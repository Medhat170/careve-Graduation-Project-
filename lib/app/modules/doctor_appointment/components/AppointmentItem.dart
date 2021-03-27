import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/utilities/colorUtil.dart';

class AppointmentItem extends StatelessWidget {
  final String doctorName;
  final String address;
  final String date;
  final String telephoneNumber;
  final String image;
  AppointmentItem(
      {@required this.doctorName,
      @required this.address,
      @required this.date,
      @required this.telephoneNumber,
      this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorUtil.mediumGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  date,
                  style: TextStyle(
                      color: ColorUtil.blackColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  doctorName,
                  style: TextStyle(
                    color: ColorUtil.blackColor,
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  address,
                  style: TextStyle(
                    color: ColorUtil.mediumGrey,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  telephoneNumber,
                  style: TextStyle(
                    color: ColorUtil.mediumGrey,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Paid',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: ColorUtil.primaryColor,
              radius: 64.0,
              backgroundImage: AssetImage(
                image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
