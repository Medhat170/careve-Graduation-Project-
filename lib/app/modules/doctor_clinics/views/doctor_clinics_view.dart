import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/clinic_card.dart';
import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/modules/clinic_editing/controllers/clinic_editing_controller.dart';
import 'package:careve/app/modules/clinic_editing/views/clinic_editing_view.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_clinics_controller.dart';

class DoctorClinicsView extends GetView<DoctorClinicsController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            S.of(context).clinics,
            enableBack: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0,
              ),
              child: Obx(
                () {
                  if (controller.isBusy.value) {
                    return Loading();
                  } else if (controller.doctorClinics.value == null ||
                      controller.doctorClinics.value.clinics.isEmpty) {
                    return EmptyWidget(
                      hint: controller.errorMessage.value,
                      extraFunction: controller.fetchDoctorClinics,
                    );
                  } else {
                    return AnimatedListHandler(
                      children: controller.doctorClinics.value.clinics
                          .map(
                            (e) => ClinicCard(
                              clinicData: e,
                              loadingId: controller.busyId,
                              removeFunction: () =>
                                  controller.removeClinic(e.id),
                              onTap: () async {
                                Get.delete<ClinicEditingController>();
                                Get.put(ClinicEditingController(e));
                                final result = await Get.to<Clinic>(
                                  () => ClinicEditingView(),
                                );
                                if (result != null) {
                                  final Clinic clinic = Clinic(
                                    id: result?.id,
                                    docId: result?.docId,
                                    address: result?.address,
                                    mobile: result?.mobile,
                                    days: result?.days,
                                  );
                                  controller.doctorClinics.update((val) {
                                    val.clinics.removeWhere(
                                      (element) => element.id == e?.id,
                                    );
                                    val.clinics.add(clinic);
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorUtil.primaryColor,
        elevation: 10.0,
        icon: const Icon(
          Icons.add,
          color: ColorUtil.whiteColor,
          size: 18.0,
        ),
        onPressed: () async {
          Get.delete<ClinicEditingController>();
          Get.put(ClinicEditingController(null));
          final result = await Get.to<Clinic>(
            () => ClinicEditingView(),
          );
          if (result != null) {
            final Clinic clinic = Clinic(
              id: result?.id,
              docId: result?.docId,
              address: result?.address,
              mobile: result?.mobile,
              days: result?.days,
            );
            controller.doctorClinics.update((val) {
              val.clinics.add(clinic);
            });
          }
        },
        label: Text(
          S.of(context).addClinic,
          style: const TextStyle(
            color: ColorUtil.whiteColor,
          ),
        ),
      ),
    );
  }
}
