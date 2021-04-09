import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/chat/components/messageHandler.dart';
import 'package:careve/app/modules/chat/components/messageViewer.dart';
import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/components/extensions.dart';

class ChatView extends GetView<ChatController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GlobalScaffold(
        body: Scaffold(
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
                        } else {
                          return NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overScroll) {
                              overScroll.disallowGlow();
                              return true;
                            },
                            child: ListView(
                              reverse: true,
                              padding: EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                                left: 8.0,
                              ),
                              children: [
                                ...[
                                  MessageViewer(
                                    id: 0,
                                    files: [],
                                    content: 'Hi there! I am using careve app',
                                    type: SelfOrOtherEnum.other,
                                    date: DateTime.now().toTimeOnly(),
                                    sender: 'Dr: Ahmed Mohamed',
                                  ),
                                  MessageViewer(
                                    id: 0,
                                    files: [],
                                    content: 'Hello there',
                                    type: SelfOrOtherEnum.self,
                                    date: DateTime.now().toTimeOnly(),
                                    sender: '',
                                  ),
                                ]
                                // ...controller
                                //     .approvalCached.value.approval_comments
                                //     .map(
                                //       (e) => MessageViewer(
                                //         id: e.id,
                                //         files: e.files,
                                //         content: e.comment,
                                //         type: e.replay_with,
                                //       ),
                                //     )
                                //     .toList()
                                //     .reversed,
                              ],
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
        ),
      ),
    );
  }
}
