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
  final String roomName;
  final toUpload = <String, File>{}.obs;

  ChatController({
    this.roomId,
    this.receiverID,
    this.roomName,
  });

  static ChatController get to => Get.find();

  Future<void> fetchAllChats() async {
    try {
      startBusy();
      final response = await get(
        ApiPath.getAllChatsWithID + receiverID.toString(),
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
        sendingText.value = true;
        final files = <d.MultipartFile>[];
        for (final f in toUpload.values) {
          files.add(await d.MultipartFile.fromFile(f.path,
              filename: basename(f.path)));
        }
        final response = await post(
          ApiPath.sendMessage,
          body: {
            'receiver_id': receiverID,
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
    fetchAllChats();
  }

  @override
  void onClose() {
    messageController.dispose();
    sendingText.value = false;
    super.onClose();
  }
}
