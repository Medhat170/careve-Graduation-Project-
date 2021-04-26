import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/modules/single_doctor/controllers/single_doctor_controller.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClinicComponent extends StatelessWidget {
  final Clinic clinic;

  const ClinicComponent({
    @required this.clinic,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    if (SingleDoctorController.to.currentClinic.value.id == clinic.id) {
      selected = true;
    }
    return GestureDetector(
      onTap: () => SingleDoctorController.to.selectClinic(clinic),
      child: Card(
        elevation: selected ? 10.0 : 3.5,
        color: selected ? ColorUtil.primaryColor : ColorUtil.lightGrey,
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppUtil.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: Get.width * 0.75,
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  color:
                      selected ? ColorUtil.whiteColor : ColorUtil.primaryColor,
                  size: 24.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Text(
                    clinic?.address?.formattedAddress,
                    style: TextStyle(
                      color: selected
                          ? ColorUtil.whiteColor
                          : ColorUtil.blackColor,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
