import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/home/components/sectionItem.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Careve',
                  style: TextStyle(
                    fontSize: 70.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Remember, we\'re here to help you ...',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorUtil.mediumGrey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: GridView(
                      scrollDirection: Axis.vertical,
                      children: controller.sections
                          .map(
                            (section) => SectionItem(
                              title: section.name,
                              image: section.image,
                            ),
                          )
                          .toList(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: Get.width * 0.4,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
