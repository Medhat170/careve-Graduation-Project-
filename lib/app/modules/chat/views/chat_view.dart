import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/chat/components/room_card.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
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
        ),
      ),
    );
  }
}
