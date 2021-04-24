import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/modules/doctors/components/doctor_item.dart';
import 'package:careve/app/utilities/path_util.dart';
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
          Widget body = AnimatedListHandler(
            children: allDoctors
                .map(
                  (doc) => DoctorItem(
                    name: doc.name,
                    id: doc.id,
                    rate: doc.rating ?? 0,
                    specialty: doc.qualified,
                    image: doc.image,
                    raters: doc.raters,
                  ),
                )
                .toList(),
          );
          if (controller.isBusy.value) {
            body = Loading();
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
