import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
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

  void setHandlers(
      Function(Map<String, dynamic>) onMessage,
      Function(Map<String, dynamic>) onLaunch,
      Function(Map<String, dynamic>) onResume) {
    this.onLaunch = onLaunch;
    this.onMessage = onMessage;
    this.onResume = onResume;
    firebaseCloudMessagingListeners();
  }

  Future setGetTokenCallback(
      void Function(String token) getTokenCallback) async {
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
  }

  static Future<void> navigateToItemDetail(LiveNotificationItem item) async {
    switch (item.type) {
      case CHAT:
        print('Navigating to Details:');
        Get.offNamed(
          Routes.CHAT,
          arguments: int.tryParse(item.id),
        );
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    setHandlers(handleFCMMessage, handleFCMMessage, handleFCMMessage);
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
  final String notificationTitle;
  final String notificationBody;
  final String id;
  final String type;
  final String sound;
  final DateTime date;

/*
{
  notification: {
    title: You Have new comment,
    body: Hi mobile
  },
  data: {
    id: 157,
    body: Hi mobile,
    type: approval_comment,
    sound: default,
    title: You Have new comment
  }
}
 */

  LiveNotificationItem({
    @required this.notificationTitle,
    @required this.notificationBody,
    @required this.id,
    @required this.type,
    @required this.sound,
    @required this.date,
  });

  factory LiveNotificationItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    print('Parsing Live Notification: $map');
    try {
      final Map<dynamic, dynamic> notification = map['notification'];
      final Map<dynamic, dynamic> data = map['data'] ?? map;
      return LiveNotificationItem(
        notificationTitle: notification['title'],
        notificationBody: notification['body'],
        id: data['id'],
        type: data['type'],
        sound: data['sound'],
        date: DateTime.now(),
      );
    } catch (e) {
      print('Error when parsing notification:\n$e');
      rethrow;
    }
  }
}

Future handleFCMMessage(Map<String, dynamic> message) async {
  print('Notification  >>>> $message<<<<');
  final item = LiveNotificationItem.fromMap(message);

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
      title: item.notificationTitle,
      body: item.notificationBody,
      snackPosition: SnackPosition.TOP,
      onTapSnack: () async {
        await FirebaseNotifications.navigateToItemDetail(item);
      },
    );
  } else {
    ChatController.to.fetchAllChats();
  }
}
