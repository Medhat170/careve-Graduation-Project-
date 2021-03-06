import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/models/section.dart';
import 'package:careve/app/modules/home/components/section_item.dart';
import 'package:careve/app/modules/home/components/user_semi_profile.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final isDoc = AuthService.to.isDoc?.value;
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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                mainAxisExtent: (Get.height -
                        Get.mediaQuery.padding.top -
                        Get.mediaQuery.padding.bottom) /
                    4,
              ),
              children: [
                if (!isDoc)
                  Section(
                    name: S.of(context).selfChecking,
                    image: PathUtil.selfCareImage,
                    onPressed: () => Get.toNamed(Routes.SELF_CHECKING),
                  ),
                if (!isDoc)
                  Section(
                    name: S.of(context).medicalRecords,
                    image: PathUtil.hospitalsImage,
                    onPressed: () => Get.toNamed(
                      Routes.MEDICAL_RECORDS,
                      arguments: AuthService.to.userId,
                    ),
                  ),
                if (isDoc)
                  Section(
                    name: S.of(context).appointments,
                    image: PathUtil.appointmentImage,
                    onPressed: () => Get.toNamed(Routes.USER_APPOINTMENTS),
                  ),
                if (isDoc)
                  Section(
                    name: S.of(context).chat,
                    image: PathUtil.chatImage,
                    onPressed: () => Get.toNamed(Routes.ROOMS),
                  ),
                if (isDoc)
                  Section(
                    name: S.of(context).more,
                    image: PathUtil.moreImage,
                    onPressed: () => Get.toNamed(Routes.USER_PROFILE),
                  ),
                Section(
                  name: S.of(context).awareness,
                  image: PathUtil.articlesImage,
                  onPressed: () => Get.toNamed(Routes.AWARENESS),
                ),
                if (!isDoc)
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
                      notification: section.notification,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
