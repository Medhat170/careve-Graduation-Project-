import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/medical_records/components/doctor_hint_card.dart';
import 'package:careve/app/modules/medical_records/components/record_card.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/medical_records_controller.dart';

class MedicalRecordsView extends GetView<MedicalRecordsController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            controller.patientName.value ?? S.of(context).medicalRecords,
            enableBack: true,
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.isBusy.value) {
                  return Loading();
                } else if (controller.allRecords?.value == null) {
                  return EmptyWidget(
                    hint: controller.errorMessage.value,
                    refreshFunction: controller.fetchAllRecords,
                  );
                } else {
                  return AnimatedListHandler(
                    children: [
                      if (!AuthService.to.isDoc.value) DoctorHintCard(),
                      ...controller.allRecords.value.data
                          .map(
                            (record) => RecordCard(
                              id: record.id,
                              title: record.name,
                              image: record.resultImage,
                              results: record.result,
                              dateTime: record.updatedAt,
                            ),
                          )
                          .toList(),
                    ],
                  );
                }
              },
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
        onPressed: () => Get.toNamed(Routes.ADD_EDIT_RECORD),
        label: Text(
          S.of(context).addRecord,
          style: const TextStyle(
            color: ColorUtil.whiteColor,
          ),
        ),
      ),
    );
  }
}
