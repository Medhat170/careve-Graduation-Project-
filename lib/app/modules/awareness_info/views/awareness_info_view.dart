import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/video_player_component.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/awareness_info/components/addition_actions.dart';
import 'package:careve/app/modules/awareness_info/components/poster_view.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/awareness_info_controller.dart';

class AwarenessInfoView extends GetView<AwarenessInfoController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: VideoPlayerComponent(
        upperChildren: [
          customAppBar(
            controller.title(),
            enableBack: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            child: Text(
              controller.article.title ?? '',
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 56.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        lowerChildren: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AnimatedListHandler(
                children: [
                  if (controller.article.links == null &&
                      controller.article.image != null)
                    const PosterView(),
                  AdditionActions(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    controller.article.body ?? '',
                    style: TextStyle(
                      color: ColorUtil.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 46.sp,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
        videoUrls: controller.article?.links != null
            ? <String>[
                controller.article?.links,
              ]
            : null,
      ),
    );
  }
}
