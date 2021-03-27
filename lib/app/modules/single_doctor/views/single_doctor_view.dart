import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/single_doctor/components/doctor_info.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/single_doctor_controller.dart';

class SingleDoctorView extends GetView<SingleDoctorController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              customAppBar(
                'Doctor_name',
                enableBack: true,
              ),
              DoctorInfo(
                id: '0',
                image: PathUtil.nearbyHospitalsImage,
                name: 'Dr. Mayme Gomez',
                specialty: 'Breast tumors',
                rate: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}