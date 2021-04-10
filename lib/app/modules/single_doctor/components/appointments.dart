import 'package:careve/app/components/AnimatedListHandler.dart';
import 'package:careve/app/modules/single_doctor/components/AppointmentItem.dart';
import 'package:careve/app/modules/single_doctor/controllers/single_doctor_controller.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointments extends GetView<SingleDoctorController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedListHandler(
      noScroll: true,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Text(
            S.of(context).appointments ?? '',
            style: TextStyle(
              fontSize: 56.sp,
              color: ColorUtil.blackColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        TabBar(
          controller: controller.tabController,
          isScrollable: true,
          indicatorColor: ColorUtil.primaryColor,
          tabs: [
            ...List.generate(
              2,
              (index) => Tab(
                child: Text(
                  'Sat',
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: 44.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        // TabBarView(
        //   controller: controller.tabController,
        //   children: <Widget>[... ],
        //   //controller: _tabController,
        // ),
        ...List.generate(
          10,
          (index) => AppointmentItem(
            date: DateTime.now(),
          ),
        ),
      ],
    );
  }
}
