import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/modules/doctors/components/doctor_item.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctors_controller.dart';

class DoctorsView extends GetView<DoctorsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Obx(
        () {
          final allDoctors = controller.allDoctors ?? <Doctor>[];
          Widget body;
          if (controller.isBusy.value) {
            body = Loading();
          } else if (allDoctors == null || allDoctors.isEmpty) {
            body = EmptyWidget(
              hint: controller.errorMessage.value,
              refreshFunction: controller.fetchAllDoctors,
            );
          } else {
            body = AnimatedListHandler(
              children: allDoctors
                  .map(
                    (doc) => DoctorItem(
                      doctor: doc,
                    ),
                  )
                  .toList(),
            );
          }
          return Column(
            children: [
              controller.customAppBar(
                S.of(context).doctors,
                enableBack: true,
                enableSearch: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: body,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
