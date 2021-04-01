import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/awareness/awareness_card.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/awareness_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AwarenessView extends GetView<AwarenessController> {
  final _tabs = <String>[
    S.current.articles,
    S.current.commonQuestions,
    S.current.videos,
  ];

  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
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
                              )
                            : AwarenessCard(
                                title:
                                    'What is symptoms and causes of breast cancer?',
                                auther: 'By Dr. Ahmed Anwar',
                                dateTime: DateTime.now(),
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
