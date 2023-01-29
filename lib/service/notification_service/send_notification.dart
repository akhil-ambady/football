import 'package:footballalert/service/base/api_service.dart';
import 'package:footballalert/utils/app_errors.dart';

class SendNotification extends ApiService {
  static const sendNotification = "/fcm/send";
  Future<bool> sendFirebaseNotification(
      String deviceID, String title, String body) async {
    var headers = <String, String>{};
    headers["Content-Type"] = "application/json";
    Map<String, dynamic> payload = {
      "to": deviceID,
      "notification": {"body": body, "title": title}
    };
    var apiPath = sendNotification;
    Future<ParsedResponse> future = post(
      apiPath,
      body: payload,
      headers: headers,
      needAuthentication: true,
    );
    return future.then((ParsedResponse res) async {
      if (res.isOk()) {
        return true;
      } else {
        throw AppError.serverError;
      }
    }).catchError((Object error) {
      throw error;
    });
  }
}
