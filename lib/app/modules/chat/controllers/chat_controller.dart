import 'dart:async';
import 'dart:io';
import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:dio/dio.dart' as d;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class ChatController extends GetxController with ApiMixin, BusyMixin {
  TextEditingController messageController = TextEditingController();
  final messageText = ''.obs;
  final sendingText = false.obs;
  final int roomId;
  final String roomName;
  final toUpload = <String, File>{}.obs;

  ChatController({
    this.roomId,
    this.roomName,
  });

  static ChatController get to => Get.find();

  // Future<void> downloadFile(String url, String fileName) async {
  //   Directory newDirectory = await FolderPicker.pick(
  //     allowFolderCreation: true,
  //     context: Get.overlayContext,
  //     rootDirectory: Directory(
  //       Platform.isAndroid
  //           ? (await getExternalStorageDirectory()).path
  //           : (await getApplicationDocumentsDirectory()).path,
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(10),
  //       ),
  //     ),
  //   );
  //   final newDir = newDirectory == null ? null : Directory(newDirectory.path);
  //   print(':::::::::::::::' + newDirectory.path);
  //   if (newDir != null && await newDir.exists()) {
  //     final taskId = await FlutterDownloader.enqueue(
  //       url: url,
  //       fileName: fileName,
  //       savedDir: newDirectory.path,
  //       showNotification: true,
  //       openFileFromNotification: true,
  //     );
  //   }
  // }

  Future<void> uploadFiles() async {
    // try {
    //   List<File> result = await FilePicker.getMultiFile(
    //     type: FileType.any,
    //   );
    //
    //   if (result != null) {
    //     toUpload.addAll(
    //       Map.fromEntries(
    //         result.map(
    //           (x) => MapEntry(basename(x.path), x),
    //         ),
    //       ),
    //     );
    //   }
    // } on PlatformException catch (e) {
    //   print("Unsupported operation" + e.toString());
    // } catch (error) {
    //   AppUtil.showAlertDialog(body: error.toString());
    // }
  }

  Future onSend() async {
    if (toUpload.isNotEmpty ||
        (messageText.value.isNotEmpty || !messageText.value.isBlank)) {
      print('message : ${messageText.value}');
      // final comment = ApprovalCommentsDto(
      //   id: -1,
      //   comment: toUpload.isNotEmpty && messageText.value.length == 0
      //       ? 'file'
      //       : messageText.value,
      //   replay_with: 'me',
      // );
      // approvalCached.update((val) {
      //   val.approval_comments.add(comment);
      // });
      messageText.value = '';
      messageController.text = '';
      try {
        sendingText.value = true;
        final files = <d.MultipartFile>[];
        for (final f in toUpload.values) {
          files.add(await d.MultipartFile.fromFile(f.path,
              filename: basename(f.path)));
        }
        // AddCommentResponse response = await APIUtil.request<AddCommentResponse>(
        //   future: api.getApprovalApi().userApprovalAddComment(
        //         chatId,
        //         appUserId: AppService.to.userId,
        //         API_TOKEN: APIUtil.apiToken,
        //         comment: comment.comment,
        //         file: ListBuilder<d.MultipartFile>(files).build(),
        //       ),
        // );
        // approvalCached.update((val) {
        //   int index = val.approval_comments.indexWhere((old) => old.id == -1);
        //   val.approval_comments[index] =
        //       cacheService.approvalRepo.fromComment(response.result);
        // });
        toUpload.clear();
      } catch (error) {
        // approvalCached.update((val) {
        //   int index = val.approval_comments.indexWhere((old) => old.id == -1);
        //   val.approval_comments.removeAt(index);
        // });
        AppUtil.showAlertDialog(body: error.toString());
      }
      sendingText.value = false;
    }
  }

  Future<void> updateApprovalStatue() async {
    // await cacheService.approvalRepo.updateStatus(
    //   chatId,
    //   status: ApprovalReadStatus.Old,
    // );
  }

  @override
  void onReady() {
    super.onReady();
    // approvalCached.value = cacheService.approvalRepo.getValueById(chatId);
    sendingText.value = false;
    messageText.value = '';
    print(roomId);
    // fetchApprovalData();
  }

  @override
  void onClose() {
    messageController.dispose();
    sendingText.value = false;
    messageText.value = '';
    super.onClose();
  }
}
