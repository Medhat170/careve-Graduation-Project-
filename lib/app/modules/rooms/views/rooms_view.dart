import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/rooms/components/room_card.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rooms_controller.dart';

class RoomsView extends GetView<RoomsController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            S.of(context).messages,
            enableBack: true,
            trailingCount: 2,
          ),
          AnimatedListHandler(
            shrinkWrap: true,
            children: [
              ...List.generate(
                5,
                (index) => RoomCard(
                  username: 'Dr: Ahmed mohamed',
                  dateTime: DateTime.now(),
                  lastMessage: 'Hi,there i am using careve app!',
                  unRead: index == 0 || index == 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
