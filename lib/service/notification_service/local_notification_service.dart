import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@drawable/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    // await _notificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (String? route) async {
    //   Get.to(() => const NotificationScreen());
    // });
    await _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage? message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "",
          "",
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      );

      await _notificationsPlugin.show(
        id,
        message?.notification?.title,
        message?.notification?.body,
        notificationDetails,
        payload: message?.data["route"],
      );
      // ignore: unused_catch_clause, empty_catches
    } on Exception catch (e) {}
  }
}
