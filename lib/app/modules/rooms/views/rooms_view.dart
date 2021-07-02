import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
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
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.isBusy.value) {
                  return Loading();
                } else if (controller.allRomes == null ||
                    controller.allRomes.isEmpty) {
                  return EmptyWidget(
                    hint: controller.errorMessage.value,
                    extraFunction: controller.fetchRooms,
                  );
                } else {
                  return AnimatedListHandler(
                    children: controller.allRomes
                        .map(
                          (room) => RoomCard(
                            username: 'Dr : ${room?.receiverName ?? ''}',
                            dateTime: room?.updatedAt,
                            lastMessage: room?.lastm ?? '',
                            id: room?.id,
                            receiverId: room?.receiverId,
                            // unRead: index == 0 || index == 3,
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
