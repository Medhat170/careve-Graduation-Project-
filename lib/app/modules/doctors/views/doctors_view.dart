import 'package:careve/app/components/AnimatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/doctors/components/doctorItem.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctors_controller.dart';

class DoctorsView extends GetView<DoctorsController> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
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
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: AnimatedListHandler(
                    children: List.generate(
                      2,
                      (index) => DoctorItem(
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
        ),
      ),
    );
  }
}
