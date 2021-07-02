import 'package:careve/app/components/empty_widget.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/chat/components/message_handler.dart';
import 'package:careve/app/modules/chat/components/message_viewer.dart';
import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/components/extensions.dart';

class ChatView extends GetView<ChatController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: <Widget>[
          customAppBar(
            controller.roomName ?? S.of(context).chat,
            enableBack: true,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Obx(() {
                    if (controller.isBusy.value) {
                      return Loading();
                    } else if (controller.allMessages == null) {
                      return EmptyWidget(
                        hint: controller.errorMessage.value,
                        extraFunction: controller.fetchAllChats,
                      );
                    } else {
                      return NotificationListener<
                          OverscrollIndicatorNotification>(
                        onNotification: (overScroll) {
                          overScroll.disallowGlow();
                          return true;
                        },
                        child: ListView(
                          reverse: true,
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            right: 8.0,
                            left: 8.0,
                          ),
                          children: controller.allMessages
                              .map(
                                (e) => MessageViewer(
                                  id: e.id,
                                  content: e.messagesText,
                                  type: e.userId.toString() ==
                                          AuthService.to.user?.value?.id
                                      ? SelfOrOtherEnum.self
                                      : SelfOrOtherEnum.other,
                                  date: e.updatedAt.toTimeWithAmPmFormat(),
                                  sender: '',
                                ),
                              )
                              .toList()
                              .reversed
                              .toList(),
                        ),
                      );
                    }
                  }),
                ),
                MessageHandler(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
