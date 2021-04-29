import 'dart:convert';

import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/clinic_model.dart' as clinicDto;
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClinicEditingController extends GetxController with BusyMixin, ApiMixin {
  final postClinics = Rx<DoctorClinicsAppointments>();
  GlobalKey<FormState> clinicFormKey = GlobalKey<FormState>();

  Future<void> fetchDoctorClinics() async {
    try {
      final userId = AuthService.to.userId;
      startBusy();
      final response = await get(
        '${ApiPath.getDoctorClinics}?docid=$userId&type=mobile',
      );
      if (response != null) {
        postClinics(DoctorClinicsAppointments.fromJson(response));
        if (postClinics?.value == null || postClinics.value.clinics.isEmpty) {
          AuthService.to.userClinics.update((val) {
            val.clinics = [
              clinicDto.Clinic(
                address: clinicDto.Address(
                  title: 'Default clinic',
                ),
                days: [],
              ),
            ];
          });
        } else {
          AuthService.to.userClinics.update((val) {
            val.clinics.assignAll(
              postClinics.value.clinics
                  .map(
                    (e) => clinicDto.Clinic(
                      phone: e.mobile,
                      address: e.address,
                      days: e.days,
                    ),
                  )
                  .toList(),
            );
          });
        }
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> editClinics() async {
    final formData = clinicFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        await AuthService.to.validateClinics();
        final userId = AuthService.to.userId;
        startBusy();
        final Map<String, dynamic> response = await post(
          ApiPath.addClinic,
          body: {
            'docid': userId,
            'clinics': json.encode({'clinics': postClinics?.value?.clinics})
          },
        );
        if (response != null) {
          postClinics(DoctorClinicsAppointments.fromJson(response));
        }
        endBusySuccess();
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  @override
  void onReady() {
    fetchDoctorClinics();
    super.onReady();
  }
}
