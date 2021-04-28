import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/single_doctor/components/appointments.dart';
import 'package:careve/app/modules/single_doctor/components/doctor_info.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/single_doctor_controller.dart';

class SingleDoctorView extends GetView<SingleDoctorController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            S.of(context).doctorData,
            enableBack: true,
          ),
          Expanded(
            child: AnimatedListHandler(
              children: [
                DoctorInfo(),
                Obx(
                  () {
                    if (controller.isBusy.value) {
                      return Loading();
                    } else if (controller.doctorClinics.value == null ||
                        controller.doctorClinics.value.data.isEmpty) {
                      return EmptyWidget(
                        hint: controller.errorMessage.value,
                        extraFunction: controller.fetchDoctorClinics,
                      );
                    } else {
                      return Appointments();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
