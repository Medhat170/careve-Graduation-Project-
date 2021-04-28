import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/models/clinic_model.dart' as address;
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:intl/intl.dart';

class SingleDoctorController extends GetxController
    with SingleGetTickerProviderMixin, BusyMixin, ApiMixin {
  final Doctor doctorData;

  SingleDoctorController(this.doctorData);

  TabController tabController;
  final selectedIndex = 0.obs;
  final loadingId = RxString();
  final doctorClinics = Rx<DoctorClinicsAppointments>();
  final currentClinic = Rx<Clinic>();
  final dateBooked = Rx<DateTime>();

  List<String> get doctorPhones =>
      doctorClinics?.value?.data?.map((e) => e?.mobile)?.toList();

  List<address.Address> get doctorAddresses =>
      doctorClinics?.value?.data?.map((e) => e?.address)?.toList();

  List<DateTime> get appointmentsOfCurrentDay {
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
    print(endTime.difference(startTime).inMinutes);
    for (int i = 0; i <= endTime.difference(startTime).inMinutes; i += 30) {
      allDateTimes.add(startTime.add(Duration(minutes: i)));
    }
    allDateTimes.removeLast();
    return allDateTimes.map((dt) => dt).toList();
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

  List<DateTime> allLike(String eee) {
    List<DateTime> allLikeDays = <DateTime>[];
    for (int i = 0; i < 23; i++) {
      final now = DateTime.now();
      final DateTime weekDay = now.add(Duration(days: i));
      if (DateFormat.E(AppUtil.currentLocale.toString())
              .format(weekDay)
              .toUpperCase() ==
          eee.toUpperCase()) {
        allLikeDays.add(weekDay);
        if (allLikeDays?.length == 3) {
          break;
        }
      }
    }
    return allLikeDays;
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

  Future<void> addNewAppointment(String date) async {
    try {
      final userData = AuthService.to.user?.value;
      loadingId(date);
      final response = await post(
        ApiPath.addNewAppointment,
        body: {
          'date': date,
          'apitoken': userData?.accessToken,
          'cost': doctorData?.cost,
          'docid': doctorData?.id,
          'type': 'mobile',
          'patientid': userData?.id,
          'clinicid': currentClinic?.value?.id
        },
      );
      if (response['data']['date'] != null) {
        final String dateAsString = response['data']['date'];
        final DateTime dateAsModel = DateTime.parse(dateAsString);
        dateBooked(dateAsModel);
        Get.back();
        AppUtil.showAlertDialog(
          body: S.current.bookedSuccess(
            dateBooked?.value?.toLongUserString(),
          ),
        );
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
    loadingId.nil();
  }
}
