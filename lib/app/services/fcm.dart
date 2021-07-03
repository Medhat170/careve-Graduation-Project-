import 'dart:convert';

import 'package:careve/app/models/message.dart';
import 'package:careve/app/modules/chat/bindings/chat_binding.dart';
import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print(message);
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print('data from background $data');
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print('notification from background $notification');
  }

  // Or do other work.
}

class FirebaseNotifications extends GetxService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future Function(Map<String, dynamic>) onLaunch;
  Future Function(Map<String, dynamic>) onResume;
  Future Function(Map<String, dynamic>) onMessage;
  Function getTokenCallback;

  // void setHandlers(
  //     Function(Remot) onMessage,
  //     Function(Map<String, dynamic>) onLaunch,
  //     Function(Map<String, dynamic>) onResume) {
  //   this.onLaunch = onLaunch;
  //   this.onMessage = onMessage;
  //   this.onResume = onResume;
  //   firebaseCloudMessagingListeners();
  // }

  Future setGetTokenCallback(
      void Function(String token) getTokenCallback) async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    _firebaseMessaging
        .getToken(
      vapidKey:
          'BMWv9DSf6LlFbZaJ8Z1xFxFGV1vcRYBRM95nJUGvRBM8HRLKeeRIBPQXB9g7MWR4snGJjMj5VF0GP8zQiIzeFiU',
    )
        .then((token) async {
      getTokenCallback(token);
      AuthService.to.fireBaseToken.value = token;
    });
  }

  void firebaseCloudMessagingListeners() {
    _firebaseMessaging.getInitialMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      print(message.notification.body);
      handleFCMMessage(message.notification);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message.notification.body);
    });
  }

  static Future<void> navigateToItemDetail(LiveNotificationItem item) async {
    switch (item.type) {
      case CHAT:
        print('Navigating to Details:');
        Get.delete<ChatController>();
        // Get.put(ChatController());
        Get.offNamed(
          Routes.CHAT,
          arguments: ChatRouteInputs(
            roomId: 0,
            roomName: item.sender,
            receiverID: item.id,
            conId: AuthService.to.isDoc.value
                ? 'u${item.id}d${AuthService.to.user.value.id}'
                : 'u${AuthService.to.user.value.id}d${item.id}',
          ),
        );
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    firebaseCloudMessagingListeners();
    setGetTokenCallback(
      (token) {
        print("FireBase Token :::: $token");
      },
    );
    super.onInit();
  }
}

const String CHAT = 'chat';

class LiveNotificationItem {
  final String sender;
  final String message;
  final int id;
  final String type;
  final String sound;
  final DateTime date;

/*
{
  notification: {
    title: notificationTitle,
    body: notificationBody
  },
  data: {
    id: 0,
    body: Hi there,
    type: chat,
    sound: default,
    title: You Have new message
  }
}
 */

  LiveNotificationItem({
    @required this.sender,
    @required this.message,
    @required this.id,
    @required this.type,
    @required this.sound,
    @required this.date,
  });

  factory LiveNotificationItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    print('Parsing Live Notification: $map');
    try {
      return LiveNotificationItem(
        sender: map['sender'],
        message: map['message'],
        id: map['id'],
        type: map['type'],
        date: DateTime.now(),
      );
    } catch (e) {
      print('Error when parsing notification:\n$e');
      rethrow;
    }
  }
}

Future handleFCMMessage(RemoteNotification message) async {
  print('Notification  >>>> $message<<<<');
  final item = LiveNotificationItem.fromMap(
    json.decode(message.body) as Map<String, dynamic>,
  );

  print('Showing dialog to user!');
  if (Get.currentRoute != '/chat') {
    // Get.snackbar(
    //   item.notificationTitle,
    //   item.notificationBody,
    //   backgroundColor: Colors.white,
    //   onTap: (GetBar x) async {
    //     await FirebaseNotifications.navigateToItemDetail(item);
    //   },
    // );
    AppUtil.showAlertSnack(
      title: item?.sender ?? '',
      body: item?.message ?? '',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      onTapSnack: () async {
        await FirebaseNotifications.navigateToItemDetail(item);
      },
    );
  } else {
    ChatController.to.allMessages.add(
      Message(
        id: 0,
        updatedAt: DateTime.now(),
        messagesText: item?.message ?? '',
        receiverId: '-1',
        userId: item?.id,
      ),
    );
  }
}
