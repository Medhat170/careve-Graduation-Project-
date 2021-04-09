import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/medical_records/components/doctor_hint_card.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/medical_records_controller.dart';

class MedicalRecordsView extends GetView<MedicalRecordsController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              customAppBar(
                S.of(context).medicalRecords,
                enableBack: true,
              ),
              Expanded(
                child: AnimatedListHandler(
                  children: [
                    DoctorHintCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
