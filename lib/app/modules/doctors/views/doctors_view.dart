import 'package:careve/app/modules/doctors/components/doctorItem.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctors_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsView extends GetView<DoctorsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lightGrey,
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 5.0),
          children: [
            controller.search(),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Top Doctors',
                style: TextStyle(
                    color: ColorUtil.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.sp),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: controller.doctors
                  .map(
                    (doctor) => DoctorItem(
                      name: doctor.name,
                      image: doctor.image,
                      specialty: doctor.specialty,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Get.width * 0.5,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
