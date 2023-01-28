import 'dart:io';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:football/main.dart';
import 'package:football/module/navigation_module/view/navigation_bar.dart';
import 'package:football/module/notification_module/controller/notification_screen_controller.dart';
import 'package:football/service/hive_services/storage_service.dart';
import 'package:football/service/notification_service/local_notification_service.dart';
import 'package:get/get.dart';

///This [FootballFirebaseMessaging] class can be generally used class for handling firebase messaging
class FootballFirebaseMessaging {
  FootballFirebaseMessaging._();

  factory FootballFirebaseMessaging() => _instance;

  static final FootballFirebaseMessaging _instance =
      FootballFirebaseMessaging._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static bool _initialized = false;
  bool isNotificationClick = false;

  ///This method will initialize local notification plugin and firebase messaging
  ///Also ask permission for iOS push notification
  Future<void> init() async {
    if (!_initialized) {
      ///calling for notification permission in iOS ,doesn't do anything in Android
      if (Platform.isIOS) {
        _firebaseMessaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      }
      //registerPushService();

      // when app in kill state and tap on here
      _firebaseMessaging.getInitialMessage().then((message) async {
        if (message != null) {
          await StorageService().initStorage();
          await StorageService().initBox("NOTIFICATION");
          await NotificationScreenController().saveNotificationToBB(message);
          Future.delayed(const Duration(seconds: 5), () {
            navigatorKey.currentState?.pushNamed('notificationScreen');
          });
        }
      });

      /// --------------------------------------------------------------
      /// Listening push notification when application is in foreground
      /// --------------------------------------------------------------
      FirebaseMessaging.onMessage.listen((message) async {
        if (message.notification != null) {
          await NotificationScreenController().saveNotificationToBB(message);
          LocalNotificationService.display(message);
        }
      });

      /// ----------------------------------------------------------------------
      /// When the app is in background but opened and user taps on notification
      /// ----------------------------------------------------------------------
      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        if (message.notification != null) {
          await NotificationScreenController().saveNotificationToBB(message);
          Get.to(() => const HomeNavigationBar());
        }
      });
      _initialized = true;
    }
  }

  /// ----------------------------------------------------------------------
  ///This method will return device push token
  /// ----------------------------------------------------------------------

  static Future<String?> registerPushService() async {
    ///Check for the push register
    String? currentToken = "";
    await FirebaseMessaging.instance.getToken().then((token) async {
      currentToken = token;
    }).catchError((onError) {});
    return currentToken;
  }

  Future<void> deleteToken() {
    return _firebaseMessaging.deleteToken();
  }
}
