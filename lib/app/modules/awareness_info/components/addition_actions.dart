import 'package:careve/app/modules/awareness_info/controllers/awareness_info_controller.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class AdditionActions extends GetView<AwarenessInfoController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            FontAwesomeIcons.share,
            color: ColorUtil.mediumGrey,
            size: 20.0,
          ),
          onPressed: () async {
            //Todo share files
            await Share.share(
              'Check out this ${controller.videoUrl} \n Careve, because we care :)',
              subject: 'Careve, because we care :)',
            );
          },
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.solidBookmark,
            color: ColorUtil.mediumGrey,
            size: 20.0,
          ),
          onPressed: () {
            //Todo save
          },
        ),
      ],
    );
  }
}
