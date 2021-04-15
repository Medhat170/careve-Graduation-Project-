import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/patients/components/paitient_card.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/patients_controller.dart';

class PatientsView extends GetView<PatientsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          controller.customAppBar(
            S.of(context).patients,
            enableBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
              ),
              child: AnimatedListHandler(
                children: List.generate(
                  4,
                  (index) => PatientCard(
                    name: ' Mayme Gomez',
                    id: 'Dr1',
                    image: PathUtil.logoIcon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
