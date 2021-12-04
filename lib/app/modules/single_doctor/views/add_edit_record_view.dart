import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/app_text_field.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/medical_records/components/record_image_handler.dart';
import 'package:careve/app/modules/medical_records/controllers/medical_records_controller.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditRecordView extends GetView<MedicalRecordsController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Obx(
        () => Column(
          children: [
            customAppBar(
              controller.editingRecord.value
                  ? S.of(context).editRecord
                  : S.of(context).addRecord,
              enableBack: true,
            ),
            Expanded(
              child: Form(
                key: controller.recordFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: AnimatedListHandler(
                    children: [
                      AppTextField(
                        controller.title,
                        hintText: S.of(context).title,
                        readOnly: controller.isBusy.value,
                        validator: const QuickTextValidator().call,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        controller.result,
                        hintText: S.of(context).suffer,
                        readOnly: controller.isBusy.value,
                        validator: const QuickTextValidator().call,
                        maxLines: 8,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RecordImageHandler(),
                      Obx(
                        () {
                          if (controller.isLoading.value) {
                            return Loading();
                          } else {
                            return AppButton(
                              title: controller.editingRecord.value
                                  ? S.of(context).edit
                                  : S.of(context).confirm,
                              margin: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              onTap: () {
                                if (controller.editingRecord.value) {
                                  controller.editRecord();
                                } else {
                                  controller.addNewRecord();
                                }
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
