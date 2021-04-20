import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/modules/awareness/components/awareness_card.dart';
import 'package:careve/app/modules/awareness_info/controllers/awareness_info_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/awareness_controller.dart';

class AwarenessView extends GetView<AwarenessController> {
  final _tabs = <String>[
    S.current.articles,
    S.current.commonQuestions,
    S.current.videos,
  ];

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          Obx(
            () => controller.customAppBar(
              S.of(context).awareness,
              enableBack: true,
              enableSearch: true,
            ),
          ),
          TabBar(
            controller: controller.tabController,
            isScrollable: true,
            indicatorColor: ColorUtil.primaryColor,
            onTap: controller.onChangeTab,
            tabs: _tabs
                .map(
                  (e) => Tab(
                    child: Text(
                      e,
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 44.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Obx(
              () => AnimatedListHandler(
                children: [
                  ...List.generate(
                    8,
                    (index) => controller.currentIndex.value != 1
                        ? AwarenessCard.image(
                            image: null,
                            title:
                                'What is symptoms and causes of breast cancer?',
                            onTap: () => Get.toNamed(
                              Routes.AWARENESS_INFO,
                              arguments: AwarenessType.video,
                            ),
                          )
                        : AwarenessCard(
                            title:
                                'What is symptoms and causes of breast cancer?',
                            auther: 'By Dr. Ahmed Anwar',
                            dateTime: DateTime.now(),
                            onTap: () => Get.toNamed(
                              Routes.AWARENESS_INFO,
                              arguments: AwarenessType.article,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AuthService.to.isDoc.value
          ? FloatingActionButton.extended(
              backgroundColor: ColorUtil.primaryColor,
              elevation: 10.0,
              icon: const Icon(
                Icons.add,
                color: ColorUtil.whiteColor,
                size: 18.0,
              ),
              onPressed: () => Get.toNamed(Routes.ADD_AWARENESS),
              label: Text(
                S.of(context).addAwareness,
                style: const TextStyle(
                  color: ColorUtil.whiteColor,
                ),
              ),
            )
          : null,
    );
  }
}
