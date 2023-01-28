import 'package:flutter/material.dart';
import 'package:footballalert/service/hive_services/storage_service.dart';

class OfflineStorage {
  static var notificationStorage = StorageService().getBox('NOTIFICATION');

  static saveNotification(Map<String, dynamic> data, String? key) async {
    try {
      if (key != null) {
        await notificationStorage.put(key, data);
        debugPrint(notificationStorage.values.toString());
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static getAllNotification() {
    try {
      dynamic allData = notificationStorage.values;
      return allData;
    } catch (e) {
      return null;
    }
  }
}
