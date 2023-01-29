import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:footballalert/main.dart';
import 'package:footballalert/module/home_module/controller/home_controller.dart';
import 'package:footballalert/module/notification_module/controller/notification_screen_controller.dart';
import 'package:footballalert/service/hive_services/storage_service.dart';
import 'package:footballalert/service/notification_service/local_notification_service.dart';

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
      ///calling for notification permission in iOS or Android,doesn't do anything in Android
      if (Platform.isIOS || Platform.isAndroid) {
        NotificationSettings settings =
            await _firebaseMessaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          debugPrint('user granted permission');
        } else if (settings.authorizationStatus ==
            AuthorizationStatus.provisional) {
          debugPrint('user granted provisional permission');
        } else {
          debugPrint('user denied all permissions');
        }
      }

      // Registering token in Firebase DB
      String? token = await registerPushService();
      saveToken(token!);

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
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${message.notification?.title}');
        if (message.notification != null) {
          HomeController().notificationTitle(message.notification?.title);
          HomeController().notificationDesc(message.notification?.body);
          LocalNotificationService.display(message);
        }
      });

      /// ----------------------------------------------------------------------
      /// When the app is in background but opened and user taps on notification
      /// ----------------------------------------------------------------------
      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        if (message.notification != null) {
          HomeController().notificationTitle(message.notification?.title);
          HomeController().notificationDesc(message.notification?.body);
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
      debugPrint("My token is $currentToken");
    }).catchError((onError) {});
    return currentToken;
  }

  Future<void> saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("UserTokens")
        .doc("User 1")
        .set({
      'token': token,
    });
  }

  Future<String> getToken() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("UserTokens")
        .doc("User 1")
        .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data['token'];
  }

  Future<void> deleteToken() {
    return _firebaseMessaging.deleteToken();
  }
}
