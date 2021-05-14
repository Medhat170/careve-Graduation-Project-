import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/models/clinic_model.dart';
import 'package:careve/app/modules/single_doctor/components/appointment_item.dart';
import 'package:careve/app/modules/single_doctor/components/clinics.dart';
import 'package:careve/app/modules/single_doctor/controllers/single_doctor_controller.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointments extends GetView<SingleDoctorController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedListHandler(
        noScroll: true,
        shrinkWrap: true,
        children: [
          Clinics(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            child: Text(
              S.of(context).appointments,
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
            onTap: (int index) => controller.selectedIndex(index),
            tabs: [
              ...List.generate(
                controller.currentClinic.value.days.length,
                (index) {
                  final Day day = controller.currentClinic.value.days[index];
                  return Tab(
                    child: Text(
                      AuthService.to.actualDay(day?.day),
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 44.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          ...List.generate(
            controller.appointmentsOfCurrentDay?.length,
            (index) {
              final DateTime currentTime =
                  controller.appointmentsOfCurrentDay[index];
              return AppointmentItem(
                date: currentTime,
                day: controller.currentClinic.value
                    .days[controller.selectedIndex.value].day,
              );
            },
          ),
        ],
      ),
    );
  }
}
