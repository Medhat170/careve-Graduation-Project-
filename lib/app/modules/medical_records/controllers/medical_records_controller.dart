import 'dart:io';

import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/all_records.dart';
import 'package:careve/app/models/user.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MedicalRecordsController extends GetxController with BusyMixin, ApiMixin {
  GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController result = TextEditingController();
  final uploadedImage = Rx<File>();
  final isLoading = false.obs;
  final canceledId = RxInt();
  final patientData = Rx<User>();
  final recordId = RxInt();
  final editingRecord = false.obs;
  final allRecords = Rx<AllRecords>();

  final int patientId;

  MedicalRecordsController(this.patientId);

  static MedicalRecordsController get to => Get.find();

  bool get isDoc => AuthService.to.isDoc?.value ?? false;

  Future<void> fetchPatientData() async {
    try {
      final userData = AuthService.to.user?.value;
      startBusy();
      final response = await post(
        ApiPath.getPatientData,
        body: {
          'patientid': patientId,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      if (response['data'] != null) {
        //TODO add User Data to UI anf fetch docRecords
        patientData(User()
          ..name = response['data']['name']
          ..email = response['data']['email']
          ..image = response['data']['image']
          ..bloodType = response['data']['bloodtype']
          ..id = response['data']['id'].toString());
        await fetchAllRecords();
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> fetchAllRecords() async {
    try {
      final userData = AuthService.to.user?.value;
      startBusy();
      final response = await post(
        ApiPath.getAllRecord,
        body: {
          'patientid': patientId ?? userData?.id,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      allRecords(AllRecords.fromJson(response));
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future<void> addNewRecord() async {
    final formData = recordFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        final userData = AuthService.to.user?.value;
        isLoading(true);
        final response = await post(
          ApiPath.addNewRecord,
          body: {
            'name': title.text,
            'patientid': userData?.id,
            'apitoken': userData?.accessToken,
            'result': result.text,
            'resultasimage': uploadedImage?.value ?? '',
            'type': 'mobile',
          },
        );
        if (response['data'] != null) {
          final record = Record.fromJson(response['data']);
          allRecords.update(
            (val) {
              val.data.add(record);
            },
          );
          result.clear();
          uploadedImage.nil();
          title.clear();
          Get.back();
        }
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
      isLoading(false);
    }
  }

  Future<void> deleteRecord(int recordId) async {
    try {
      canceledId(recordId);
      final userData = AuthService.to.user?.value;
      final response = await post(
        ApiPath.removeRecord,
        body: {
          'id': recordId,
          'apitoken': userData?.accessToken,
          'type': 'mobile',
        },
      );
      if (response['data'] != null) {
        allRecords.value.data.removeWhere(
          (element) => element.id == canceledId.value,
        );
      }
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
    }
    canceledId.nil();
  }

  Future<void> editRecord() async {
    final formData = recordFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        isLoading(true);
        final userData = AuthService.to.user?.value;
        final response = await post(
          ApiPath.editRecord,
          body: {
            'name': title.text,
            'id': recordId,
            'apitoken': userData?.accessToken,
            'result': result.text,
            'resultasimage': uploadedImage?.value ?? '',
            'type': 'mobile',
          },
        );
        if (response['data'] != null) {
          final record = Record.fromJson(response['data']);
          allRecords.update(
            (val) {
              val.data.removeWhere(
                (element) => element.id == recordId?.value,
              );
              val.data.add(record);
            },
          );
          recordId.nil();
          result.clear();
          uploadedImage.nil();
          title.clear();
          Get.back();
        }
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
      isLoading(false);
    }
  }

  @override
  void onReady() {
    if (patientId != null && isDoc) {
      fetchPatientData();
    } else {
      fetchAllRecords();
    }
    super.onReady();
  }

  @override
  void onClose() {
    result.dispose();
    title.dispose();
    recordId.nil();
    uploadedImage.nil();
    canceledId.nil();
    super.onClose();
  }
}
