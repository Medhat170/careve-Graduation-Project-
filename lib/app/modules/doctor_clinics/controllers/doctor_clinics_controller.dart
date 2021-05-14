import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class DoctorClinicsController extends GetxController with ApiMixin, BusyMixin {
  final doctorClinics = Rx<DoctorClinicsAppointments>();

  Future<void> fetchDoctorClinics() async {
    try {
      final userId = AuthService.to.user?.value?.id;
      startBusy();
      final response = await get(
        '${ApiPath.getDoctorClinics}?docid=$userId&type=mobile',
      );
      if (response != null) {
        doctorClinics(DoctorClinicsAppointments.fromJson(response));
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> removeClinic(int clinicId) async {
    try {
      final accessToken = AuthService.to.user?.value?.accessToken;
      busyId(clinicId);
      print('Clinic id :$clinicId');
      print(accessToken);
      final Map<String, dynamic> response = await post(
        ApiPath.deleteClinic,
        body: {
          'clinicid': clinicId,
          'apitoken': accessToken,
          'type': 'mobile',
        },
      );
      if (response != null && response['data'] == 1) {
        doctorClinics.update((val) {
          val.clinics.removeWhere(
            (element) => element.id == clinicId,
          );
        });
      }
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
    }
    busyId.nil();
  }

  @override
  void onReady() {
    fetchDoctorClinics();
    super.onReady();
  }
}
