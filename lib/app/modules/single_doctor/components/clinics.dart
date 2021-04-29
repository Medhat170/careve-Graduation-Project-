import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/models/clinic_model.dart';
import 'package:careve/app/modules/single_doctor/components/appointment_item.dart';
import 'package:careve/app/modules/single_doctor/components/clinic_component.dart';
import 'package:careve/app/modules/single_doctor/controllers/single_doctor_controller.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Clinics extends GetView<SingleDoctorController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Text(
            S.of(context).clinics,
            style: TextStyle(
              fontSize: 56.sp,
              color: ColorUtil.blackColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: 130.0,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.doctorClinics?.value?.clinics?.length,
              itemBuilder: (context, index) {
                final clinic = controller.doctorClinics?.value?.clinics[index];
                return ClinicComponent(
                  clinic: clinic,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
