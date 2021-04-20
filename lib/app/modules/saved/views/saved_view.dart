import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/awareness_info/controllers/awareness_info_controller.dart';
import 'package:careve/app/modules/saved/components/saved_card.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/saved_controller.dart';

class SavedView extends GetView<SavedController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            S.of(context).saved,
            enableBack: true,
            trailing: IconButton(
              icon: Icon(
                FontAwesomeIcons.broom,
                color: ColorUtil.errorColor,
                size: 20.0,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: AnimatedListHandler(
              children: [
                ...List.generate(
                  2,
                  (index) => SavedCard(
                    title: 'What is symptoms and causes of breast cancer?',
                    image: index == 0 ? 'image' : null,
                    dateTime: DateTime.now(),
                    type: index == 0
                        ? AwarenessType.video
                        : AwarenessType.article,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
