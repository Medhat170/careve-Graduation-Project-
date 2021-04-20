import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/modules/doctors/components/doctor_item.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctors_controller.dart';

class DoctorsView extends GetView<DoctorsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          Obx(
            () => controller.customAppBar(
              'Top Doctors',
              enableBack: true,
              enableSearch: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
              ),
              child: AnimatedListHandler(
                children: List.generate(
                  2,
                  (index) => const DoctorItem(
                    name: 'Dr. Mayme Gomez',
                    id: 'Dr1',
                    rate: 4.5,
                    specialty: 'Breast tumors',
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
