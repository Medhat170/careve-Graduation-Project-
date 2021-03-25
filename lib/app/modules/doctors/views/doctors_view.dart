import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/doctors/components/doctorItem.dart';
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
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowGlow();
                  return true;
                },
                child: Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 5.0,
                    ),
                    children: [
                      GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: controller.doctors
                            .map(
                              (doctor) => DoctorItem(
                                name: doctor.name,
                                image: doctor.image,
                                specialty: doctor.specialty,
                              ),
                            )
                            .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: Get.width * 0.5,
                          childAspectRatio: 1 / 1,
                        ),
                      ),
                    ],
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
