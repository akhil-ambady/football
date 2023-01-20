
class NotificationModel {
  String? _messageId;
  String? _notificationTitle;
  String? _notificationSubTitle;
  String? _date;
  bool? _isRead;

  String? get messageId => _messageId;

  String? get notificationTitle => _notificationTitle;

  String? get notificationSubTitle => _notificationSubTitle;

  bool? get isRead => _isRead;

  String? get date => _date;

  set setIsRead(bool isRead) {
    _isRead = isRead;
  }

  NotificationModel({
    String? messageId,
    String? notificationTitle,
    String? notificationSubTitle,
    bool? isRead,
    String? date,
  }) {
    _messageId = messageId;
    _notificationTitle = notificationTitle;
    _notificationSubTitle = notificationSubTitle;
    _isRead = isRead;
    _date = date;
  }

  NotificationModel.fromJson(dynamic json) {
    _messageId = json['messageId'];
    _notificationTitle = json['notificationTitle'];
    _notificationSubTitle = json['notificationSubTitle'];
    _isRead = json["isRead"];
    _date = json["date"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['messageId'] = _messageId;
    map['notificationTitle'] = _notificationTitle;
    map['notificationSubTitle'] = _notificationSubTitle;
    map['isRead'] = _isRead;
    map['date'] = _date;

    return map;
  }
}
