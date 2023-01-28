import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    FlutterLocalNotificationsPlugin notificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await notificationsPlugin.initialize(initializationsSettings,
        onDidReceiveNotificationResponse: (payload) async {
      if (payload.payload != null) {
        debugPrint('notification payload: ${payload.payload}');
      }
    });
  }

  static void display(RemoteMessage? message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message?.notification?.body ?? "Body",
          htmlFormatBigText: true,
          contentTitle: message?.notification?.title ?? "Title",
          htmlFormatContent: true);
      AndroidNotificationDetails androidPlatformSpecifics =
          AndroidNotificationDetails("FootballAlert", "FootballAlert",
              importance: Importance.high,
              styleInformation: bigTextStyleInformation,
              priority: Priority.high,
              playSound: true);
      NotificationDetails platformSpecifics = NotificationDetails(
        android: androidPlatformSpecifics,
        iOS: const DarwinNotificationDetails(),
        macOS: const DarwinNotificationDetails(),
        linux: const LinuxNotificationDetails(),
      );
      await _notificationsPlugin.show(id, message?.notification?.title,
          message?.notification?.body, platformSpecifics,
          payload: message?.notification?.body ?? "");
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
