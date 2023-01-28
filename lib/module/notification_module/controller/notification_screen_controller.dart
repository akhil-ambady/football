import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:footballalert/module/notification_module/model/notification_model.dart';
import 'package:footballalert/service/hive_services/offline_storage.dart';
import 'package:get/get.dart';


class NotificationScreenController extends GetxController {
  static final NotificationScreenController _singleton = NotificationScreenController._internal();

  factory NotificationScreenController() {
    return _singleton;
  }

  NotificationScreenController._internal();

  List<NotificationModel>? notificationList = <NotificationModel>[].obs;
  var token = "".obs;
  var count = 0.obs;
  var isExpanded = false.obs;

  @override
  void onInit() {
    fetchNotification();
    super.onInit();
  }

  Future fetchNotification() async {
    count.value = 0 ;
    try {
      var allData = OfflineStorage.getAllNotification();
      if (allData != null) {
        notificationList?.clear();
        for (Map data in allData) {
          final NotificationModel notification = NotificationModel.fromJson(data);
          if (!(notification.isRead?? false) ) {
            count.value += 1;
          }
          notificationList?.add(notification);
        }

        notificationList?.sort((b, a) => a.date!.compareTo(b.date!));
      }
      updateUI();
      return true;
    } catch (e) {
      return false;
    }
  }

  saveNotificationToBB(RemoteMessage message) async {
    var notificationMap = <String, dynamic>{};

    notificationMap['messageId'] = message.messageId ?? "";
    notificationMap['notificationTitle'] = message.notification?.title ?? "";
    notificationMap['notificationSubTitle'] = message.notification?.body ?? "";
    notificationMap['isRead'] = false;
    notificationMap['date'] = DateTime.now().toString();
    OfflineStorage.saveNotification(notificationMap, message.messageId ?? "");
    fetchNotification();
  }

  updateUI() {
    update();
  }
}
