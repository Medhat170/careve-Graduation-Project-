import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/models/section.dart';
import 'package:careve/app/modules/home/components/section_Item.dart';
import 'package:careve/app/modules/home/components/user_semi_profile.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: UserSemiProfile(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: GridView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Section(
                  name: S.of(context).selfCare,
                  image: PathUtil.selfCareImage,
                ),
                Section(
                  name: S.of(context).medicalRecords,
                  image: PathUtil.hospitalsImage,
                  onPressed: () => Get.toNamed(Routes.MEDICAL_RECORDS),
                ),
                Section(
                  name: S.of(context).awareness,
                  image: PathUtil.articlesImage,
                  onPressed: () => Get.toNamed(Routes.AWARENESS),
                ),
                Section(
                  name: S.of(context).doctors,
                  image: PathUtil.doctorsImage,
                  onPressed: () => Get.toNamed(Routes.DOCTORS),
                ),
              ]
                  .map(
                    (section) => SectionItem(
                      title: section.name,
                      image: section.image,
                      onTap: section.onPressed,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                mainAxisExtent: (Get.height -
                        Get.mediaQuery.padding.top -
                        Get.mediaQuery.padding.bottom) /
                    4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
