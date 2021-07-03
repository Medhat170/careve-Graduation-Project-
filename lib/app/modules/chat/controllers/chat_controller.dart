import 'dart:async';
import 'dart:io';
import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/message.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:dio/dio.dart' as d;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class ChatController extends GetxController with ApiMixin, BusyMixin {
  final allMessages = RxList<Message>(<Message>[]);
  TextEditingController messageController = TextEditingController();
  final sendingText = false.obs;
  final int roomId;
  final int receiverID;
  final String conId;
  final String roomName;
  final toUpload = <String, File>{}.obs;

  ChatController({
    this.roomId,
    this.receiverID,
    this.conId,
    this.roomName,
  });

  static ChatController get to => Get.find();

  Future<void> fetchAllChats() async {
    try {
      startBusy();
      final response = await get(
        ApiPath.getAllChatsWithConId + conId,
      );
      if (response['data'] != null) {
        allMessages.assignAll(
            AllMessages.fromJson(response).allMessages ?? <Message>[]);
      }
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error,
        showDialog: errorMessage.value != S.current.socketException,
      );
    }
  }

  Future onSend() async {
    if (toUpload.isNotEmpty ||
        (messageController.text.isNotEmpty ||
            !messageController.text.isBlank)) {
      print('message : ${messageController.text}');
      final message = Message(
        id: -1,
        messagesText: messageController.text,
        userId: int.tryParse(AuthService.to.user?.value?.id ?? '-1'),
      );
      allMessages.add(message);
      messageController.text = '';
      try {
        final String actualReceiverID = !AuthService.to.isDoc.value
            ? conId.split('d')[1]
            : conId.substring(1).split('d')[0];
        print('CodId :: $actualReceiverID');
        sendingText.value = true;
        final response = await post(
          ApiPath.sendMessage,
          body: {
            'receiver_id': actualReceiverID ?? receiverID,
            'messages': message.messagesText,
          },
        );
        if (response['data'] != null) {
          final int index = allMessages.indexWhere((old) => old.id == -1);
          allMessages[index] = MessageData.fromJson(response).messageData;
        }
        toUpload.clear();
      } catch (error) {
        final int index = allMessages.indexWhere((old) => old.id == -1);
        allMessages.removeAt(index);
        AppUtil.showAlertDialog(body: error.toString());
      }
      sendingText.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    sendingText.value = false;
    print(roomId);
    print(receiverID);
    print(conId);
    print(AuthService.to.user.value.accessToken);
    fetchAllChats();
  }

  @override
  void onClose() {
    messageController.dispose();
    sendingText.value = false;
    super.onClose();
  }
}
