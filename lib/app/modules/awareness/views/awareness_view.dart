import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/modules/awareness/components/awareness_card.dart';
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
          controller.customAppBar(
            S.of(context).awareness,
            enableBack: true,
          ),
          Expanded(
            child: Obx(() {
              if (controller.isBusy.value) {
                return Loading();
              } else if (controller.blog.value == null ||
                  controller.blog.value.data.isEmpty) {
                return EmptyWidget(
                  hint: controller.errorMessage.value,
                  extraFunction: controller.fetchAllAwareness,
                );
              } else {
                return Column(
                  children: [
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
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          AnimatedListHandler(
                            children: [
                              if (controller.articles.isNotEmpty)
                                ...controller.articles
                                    .map(
                                      (e) => AwarenessCard.image(
                                        image: e?.image,
                                        title: e?.title,
                                        onTap: () => Get.toNamed(
                                          Routes.AWARENESS_INFO,
                                          arguments: e,
                                        ),
                                      ),
                                    )
                                    .toList()
                              else
                                const EmptyWidget()
                            ],
                          ),
                          AnimatedListHandler(
                            children: [
                              if (controller.qA.isNotEmpty)
                                ...controller.qA
                                    .map(
                                      (e) => AwarenessCard(
                                        title: e?.title,
                                        dateTime: e?.updatedAt,
                                        onTap: () => Get.toNamed(
                                          Routes.AWARENESS_INFO,
                                          arguments: e,
                                        ),
                                      ),
                                    )
                                    .toList()
                              else
                                const EmptyWidget()
                            ],
                          ),
                          AnimatedListHandler(
                            children: [
                              if (controller.videos.isNotEmpty)
                                ...controller.videos
                                    .map(
                                      (e) => AwarenessCard.image(
                                        image: e?.image,
                                        title: e?.title,
                                        onTap: () => Get.toNamed(
                                          Routes.AWARENESS_INFO,
                                          arguments: e,
                                        ),
                                      ),
                                    )
                                    .toList()
                              else
                                const EmptyWidget()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
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
