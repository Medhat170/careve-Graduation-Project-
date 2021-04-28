import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
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

  bool get isDoc => AuthService.to.isDoc?.value ?? false;

  List<Appointment> get later => allAppointments
      .where(
        (element) => element.date.difference(DateTime.now()).inDays > 2,
      )
      .toList();

  final allAppointments = RxList<Appointment>([]);
  final loadingId = RxInt();

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
      allAppointments(AllAppointments.fromJson(response).data);
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> fetchAllDoctorAppointments() async {
    try {
      final userData = AuthService.to.user?.value;
      startBusy();
      final response = await post(
        ApiPath.getDoctorAppointments,
        body: {
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      allAppointments(AllAppointments.fromJson(response).data);
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> cancelAppointment(
    int appointmentId, {
    bool isFinished = false,
    int docId,
    String docName,
  }) async {
    print('Appointment finished : $isFinished');
    try {
      final userData = AuthService.to.user?.value;
      loadingId(appointmentId);
      final response = await post(
        ApiPath.cancelAppointment,
        body: {
          'id': appointmentId,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      if (response['data'] != null) {
        final int success = int.tryParse(response['data'].toString());
        if (success == 1) {
          if (isFinished) {
            final int rate = await AppUtil.showRateDialog(docName);
            if (rate != null) {
              await rateDoctor(docId, rate);
            }
          }
          allAppointments.removeWhere(
            (element) => element.id == loadingId.value,
          );
        } else {
          throw S.current.formatException;
        }
      }
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
    loadingId.nil();
  }

  Future<void> rateDoctor(int docId, int rating) async {
    try {
      final userData = AuthService.to.user?.value;
      final response = await post(
        ApiPath.rateDoc,
        body: {
          'rating': rating,
          'docid': docId,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      if (response['data'] != null) {}
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  @override
  void onReady() {
    if (isDoc) {
      fetchAllDoctorAppointments();
    } else {
      fetchAllAppointments();
    }
    super.onReady();
  }
}
