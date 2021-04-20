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
              'What is symptoms and causes of breast cancer?',
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
                  if (controller.awarenessType == AwarenessType.article)
                    const PosterView(),
                  AdditionActions(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Cancer in breast cancer. Breast cancer after skin cancer is the most common type of cancer in women in the United States. Breast cancer may affect women, women and girls.\n Significant support has helped in obtaining services for breast services and treatment.\n Survival rates have increased Surviving breast cancer patients, and the number of deaths associated with this disease decreased on a regular basis, due largely to a number of factors,such as early detection, the use of a new treatment method that takes into account the individual case, and a better understanding of the nature of this disease.',
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
        videoUrls: controller.awarenessType != AwarenessType.video
            ? null
            : [
                controller.videoUrl,
              ],
      ),
    );
  }
}
