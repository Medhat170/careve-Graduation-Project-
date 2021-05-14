import 'dart:convert';

import 'package:careve/app/models/clinic_model.dart' as clinicDto;
import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ClinicEditingController extends GetxController with BusyMixin, ApiMixin {
  final Clinic clinicForEdit;

  ClinicEditingController(this.clinicForEdit);

  final clinic = Rx<Clinic>();
  final currentLocation = Rx<Position>();

  GlobalKey<FormState> clinicFormKey = GlobalKey<FormState>();

  String changeAddress({
    String formattedAddress,
    String title,
    double lat,
    double long,
  }) {
    final clinicTemp = clinic?.value;
    clinicTemp.address ??= clinicDto.Address();
    if (lat != null) {
      clinicTemp.address.lat = lat;
    }
    if (long != null) {
      clinicTemp.address.long = long;
    }
    if (formattedAddress != null) {
      clinicTemp.address.formattedAddress = formattedAddress;
    }
    clinic.update((val) {
      val = clinicTemp;
    });
    return formattedAddress;
  }

  String changePhone(String newPhone) {
    clinic.value.mobile = newPhone;
    return newPhone;
  }

  String changeClinicTitle(String title) {
    clinic.value?.address?.title = title;
    return title;
  }

  void removeDay(int dayIndex) {
    clinic.update((val) {
      val.days.removeAt(dayIndex);
    });
  }

  void changeDay({
    DateTime startTime,
    DateTime endTime,
    String day,
  }) {
    final clinicTemp = clinic?.value;
    clinicTemp.days ??= <clinicDto.Day>[];
    final int dayIndex = clinic?.value?.days?.indexWhere(
      (element) => element.day == day,
    );
    try {
      if (dayIndex != null && dayIndex != -1) {
        final clinicDto.Day targetDay = clinic.value.days[dayIndex];
        if (startTime != null) {
          targetDay.startTime = startTime.toTimeOnly();
        } else if (endTime != null) {
          final now = DateTime.now();
          final int startHour =
              int.tryParse(targetDay?.startTime?.split(':')[0]);
          final int startMin =
              int.tryParse(targetDay?.startTime?.split(':')[1]) ?? 0;
          if (endTime.isAfter(
            DateTime(
              now.year,
              now.month,
              now.day,
              startHour,
              startMin,
            ),
          )) {
            targetDay.endTime = endTime.toTimeOnly();
          } else {
            throw S.current.timeIsBefore;
          }
        }
        targetDay.status = 1;
        clinic.update((val) {
          val.days[dayIndex] = targetDay;
        });
      } else {
        clinic.update((val) {
          val.days.add(
            clinicDto.Day(
              day: day,
              startTime: startTime.toTimeOnly(),
              endTime: endTime.toTimeOnly(),
              status: 1,
            ),
          );
        });
      }
    } catch (e) {
      AppUtil.showAlertDialog(body: e.toString());
    }
  }

  Future<void> validateClinics() async {
    print('Starting clinics validation ...');
    try {
      if (clinic?.value?.days == null || clinic.value.days.isEmpty) {
        throw S.current.daysNull;
      } else {
        for (final clinicDto.Day day in clinic.value.days) {
          if (day?.endTime == null || day?.endTime == '-') {
            final dayRef = AuthService.to.actualDay(day.day);
            throw S.current.endTimeNull(dayRef);
          }
        }
      }
      print('Clinics validated successfully');
    } catch (error) {
      print('Clinics validation error ( ${error.toString()} )');
      rethrow;
    }
  }

  Future<void> editClinic() async {
    print('clinic : ${json.encode(clinic?.value)}');
    final formData = clinicFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        await validateClinics();
        final userData = AuthService.to.user?.value;
        startBusy();
        final Map<String, dynamic> response = await post(
          ApiPath.updateClinic,
          body: {
            'apitoken': userData?.accessToken,
            'clinicid': clinic?.value?.id,
            'type': 'mobile',
            'mobile': clinic?.value?.mobile,
            'address': json.encode(clinic?.value?.address),
            'days': json.encode(clinic?.value?.days),
          },
        );
        if (response != null) {
          clinic(
            DoctorClinicsAppointments.fromJson(response)?.clinics?.first,
          );
          Get.back<Clinic>(
            result: clinic.value,
          );
        }
        endBusySuccess();
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  Future<void> addClinic() async {
    final formData = clinicFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        await validateClinics();
        final userId = AuthService.to.userId;
        startBusy();
        clinicDto.Clinic adaptiveClinic = clinicDto.Clinic(
          phone: clinic?.value?.mobile,
          days: clinic?.value?.days,
          address: clinic?.value?.address,
        );
        print(json.encode({
          'clinics': [adaptiveClinic]
        }));
        print(userId);
        final Map<String, dynamic> response = await post(
          ApiPath.addClinic,
          body: {
            'docid': userId,
            'clinics': json.encode({
              'clinics': [
                adaptiveClinic,
              ],
            }),
          },
        );
        if (response != null) {
          clinic(DoctorClinicsAppointments.fromJson(response).clinics.first);
          Get.back<Clinic>(
            result: clinic.value,
          );
        }
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
      endBusySuccess();
    }
  }

  @override
  void onReady() {
    if (clinicForEdit != null) {
      print('Editing');
      clinic(clinicForEdit);
    } else {
      print('Adding');
      clinic(
        Clinic(),
      );
    }
    endBusySuccess();
    super.onReady();
  }

  @override
  void onClose() {
    clinic.nil();
    super.onClose();
  }
}
