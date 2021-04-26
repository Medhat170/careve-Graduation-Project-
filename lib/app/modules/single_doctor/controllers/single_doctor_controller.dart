import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/components/extensions.dart';

class SingleDoctorController extends GetxController
    with SingleGetTickerProviderMixin, BusyMixin, ApiMixin {
  final Doctor doctorData;

  SingleDoctorController(this.doctorData);

  TabController tabController;
  final selectedIndex = 0.obs;
  final doctorClinics = Rx<DoctorClinicsAppointments>();
  final currentClinic = Rx<Clinic>();

  List<String> get appointmentsOfCurrentDay {
    final currentDay = currentClinic.value.days[selectedIndex.value];
    final String startHour = currentDay.startTime.split(':')[0];
    final String startMin = currentDay.startTime.split(':')[1];
    final String endHour = currentDay.endTime.split(':')[0];
    final String endMin = currentDay.endTime.split(':')[1];
    final DateTime dateTimeNow = DateTime.now();
    final DateTime startTime = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      int.tryParse(startHour ?? '00'),
      int.tryParse(startMin ?? '00'),
    );
    final DateTime endTime = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      int.tryParse(endHour ?? '00'),
      int.tryParse(endMin ?? '30'),
    );
    final allDateTimes = RxList<DateTime>([]);
    for (int i = 0; i <= endTime.difference(startTime).inMinutes; i += 30) {
      allDateTimes.add(startTime.add(Duration(minutes: i + 30)));
    }
    return allDateTimes.map((dt) => dt.toTimeWithAmPmFormat()).toList();
  }

  String actualDay(String day) {
    final List<String> ref = [
      'SAT',
      'SUN',
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
    ];

    final List<String> intlDays = [
      S.current.sat,
      S.current.sun,
      S.current.mon,
      S.current.tue,
      S.current.wed,
      S.current.thu,
      S.current.fri,
    ];
    final int index = ref.indexWhere((element) => element == day.toUpperCase());
    if (index != null && index != -1) {
      return intlDays[index];
    } else {
      return day;
    }
  }

  static SingleDoctorController get to => Get.find();

  @override
  void onReady() {
    fetchDoctorClinics();
    super.onReady();
  }

  @override
  void onClose() {
    if (tabController != null) {
      tabController.dispose();
    }

    super.onClose();
  }

  void selectClinic(Clinic clinic) {
    currentClinic(clinic);
    tabController = TabController(
      length: clinic?.days?.length,
      vsync: this,
    );
  }

  Future<void> fetchDoctorClinics() async {
    try {
      startBusy();
      final response = await get(
        '${ApiPath.getDoctorClinics}?docid=${doctorData?.id}&type=mobile',
      );
      if (response != null) {
        doctorClinics(DoctorClinicsAppointments.fromJson(response));
        if (doctorClinics.value?.data != null &&
            doctorClinics.value.data.isNotEmpty) {
          currentClinic(doctorClinics.value?.data?.first);
          tabController = TabController(
            length: currentClinic?.value?.days?.length,
            vsync: this,
          );
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
}
