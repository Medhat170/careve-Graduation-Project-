import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/appTextField.dart';
import 'package:careve/app/modules/home/components/sectionItem.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: ListView(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
                bottom: 5.0,
              ),
              children: [
                SizedBox(
                  height: 30.0,
                  child: AppTextField(
                    controller.searchText,
                    disablePrefixColor: true,
                    hintText: S.of(context).search,
                    onSaved: (String value) {
                      //TODO search
                    },
                    prefixWidget: Icon(
                      FontAwesomeIcons.search,
                      color: ColorUtil.mediumGrey,
                      size: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Careve',
                  style: TextStyle(
                    fontSize: 70.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
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
                  height: 10.0,
                ),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
