import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:footballalert/module/following_module/view/game_screen.dart';
import 'package:footballalert/module/home_module/view/pl_table_screen.dart';
import 'package:footballalert/module/navigation_module/controller/nav_controller.dart';
import 'package:footballalert/module/profile_module/view/player_profile.dart';
import 'package:footballalert/service/notification_service/firebase_messaging.dart';
import 'package:footballalert/service/notification_service/send_notification.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final HomeController _singleton = HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  var token = "".obs;
  var isLoading = false.obs;
  var notificationTitle = "".obs;
  var notificationDesc = "".obs;

  @override
  void onInit() {
    fetchDeviceID();
    super.onInit();
  }

  HomeController._internal();

  Future<void> callNumber() async {
    const number = '9048658623'; //set the number here
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future fetchDeviceID() async {
    String myToken = await FootballFirebaseMessaging().getToken();
    token(myToken);
  }

  void sendNotification(String title, String body) async {
    try {
      isLoading(true);
      bool isSuccess = await SendNotification()
          .sendFirebaseNotification(token.value, title, body);
      if (isSuccess) {
        isLoading(false);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void checkNotification(BuildContext context) {
    if (notificationTitle.value == "Tesla Cars") {
      _showMyDialog(context);
    } else if (notificationTitle.value == "Match Started") {
      NavController().changeTabIndex(2);
      NavController().update();
      notificationTitle("");
      notificationDesc("");
    } else if (notificationTitle.value == "Match goal") {
      Get.to(const GameScreen());
      notificationTitle("");
      notificationDesc("");
    } else if (notificationTitle.value == "Match foul") {
      Get.to(const PlayerProfileScreen());
      notificationTitle("");
      notificationDesc("");
    } else if (notificationTitle.value == "PL Table update") {
      Get.to(const PLTableScreen());
      notificationTitle("");
      notificationDesc("");
    } else {
      debugPrint('No Notification');
    }
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$notificationTitle'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$notificationDesc'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                notificationTitle("");
                notificationDesc("");
              },
            ),
          ],
        );
      },
    );
  }
}
