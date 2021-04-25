import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/patient_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class UserAppointmentsController extends GetxController
    with ApiMixin, BusyMixin {
  List<Appointment> get today => allAppointments
      .where(
        (element) =>
            element.date.day == DateTime.now().day &&
            element.date.month == DateTime.now().month,
      )
      .toList();

  List<Appointment> get earlier => allAppointments
      .where(
        (element) =>
            element.date.difference(DateTime.now()).inDays <= 2 &&
            element.date.difference(DateTime.now()).inDays >= 1,
      )
      .toList();

  List<Appointment> get later => allAppointments
      .where(
        (element) => element.date.difference(DateTime.now()).inDays > 2,
      )
      .toList();

  final allAppointments = RxList<Appointment>([]);
  final cancelledId = RxInt();

  static UserAppointmentsController get to => Get.find();

  Future<void> fetchAllAppointments() async {
    try {
      final userData = AuthService.to.user?.value;
      startBusy();
      final response = await post(
        ApiPath.getPatientAppointments,
        body: {
          'patientid': userData?.id,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      allAppointments(PatientAppointments.fromJson(response).data);
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> cancelAppointment(int appointmentId) async {
    try {
      final userData = AuthService.to.user?.value;
      cancelledId(appointmentId);
      final response = await post(
        ApiPath.getPatientAppointments,
        body: {
          'id': appointmentId,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      await fetchAllAppointments();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
    cancelledId.nil();
  }

  @override
  void onReady() {
    fetchAllAppointments();
    super.onReady();
  }
}
