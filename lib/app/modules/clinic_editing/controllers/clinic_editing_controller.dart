import 'dart:convert';

import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/clinic_model.dart' as address_day;
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class ClinicEditingController extends GetxController with BusyMixin, ApiMixin {
  final userClinics = Rx<DoctorClinicsAppointments>();

  Future<void> fetchDoctorClinics() async {
    try {
      final userId = AuthService.to.userId;
      startBusy();
      final response = await get(
        '${ApiPath.getDoctorClinics}?docid=$userId&type=mobile',
      );
      if (response != null) {
        userClinics(DoctorClinicsAppointments.fromJson(response));
        if (userClinics?.value == null || userClinics.value.clinics.isEmpty) {
          userClinics.update((val) {
            val.clinics = [
              Clinic(
                address: address_day.Address(
                  title: 'Default clinic',
                ),
                days: [],
              ),
            ];
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
    try {
      final userId = AuthService.to.userId;
      startBusy();
      await validateClinics();
      final Map<String, dynamic> response = await post(
        ApiPath.addClinic,
        body: {
          'docid': userId,
          'clinics': json.encode({'clinics': userClinics?.value?.clinics})
        },
      );
      if (response != null) {
        userClinics(DoctorClinicsAppointments.fromJson(response));
      }
      endBusySuccess();
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
    }
  }

  Future<void> validateClinics() async {
    try {
      for (final Clinic clinic in userClinics.value.clinics) {
        for (final address_day.Day day in clinic.days) {
          if (day.endTime == null) {
            throw S.current.endTimeNull(day.day);
          }
        }
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  void onReady() {
    fetchDoctorClinics();
    super.onReady();
  }
}
