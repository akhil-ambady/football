import 'dart:async';
import 'dart:convert';
import 'package:footballalert/utils/app_errors.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ApiService {
  String baseURL = "https://fcm.googleapis.com";

  Future<ParsedResponse> post(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      encoding,
      bool needAuthentication = false}) async {
    String url;
    url = baseURL + path;
    var uri = Uri.parse(url);

    if (needAuthentication) {
      headers?['Content-Type'] = "application/json";
      headers?['Authorization'] =
          "key = AAAA1pMK0Mo:APA91bHBBWKwH7bYVSzC7oG5Q_JlAoHWIdBFTcknyi3viWkwIiSqn3lBo-3hindoZUFnLzII0d6Cn_raVqznhRRy583hbHdmNuShPMhVtr5Lq2pua7gsKyPyjee4RI9KQIDrVatd63Fj";
    }

    return http
        .post(uri,
            body: json.encode(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int code = response.statusCode;
      if (response.statusCode == 200) {
        return ParsedResponse(code, res);
      }

      if (res.isEmpty) {
        throw AppError.serverError;
      } else {
        return ParsedResponse(code, res);
      }
    }).catchError((Object e) {
      throw AppError.noInternet;
    });
  }
}

class ParsedResponse {
  int code;
  String response;

  ParsedResponse(this.code, this.response);

  bool isOk() {
    return code == 200;
  }

  @override
  String toString() {
    return 'ParsedResponse{code : $code, response : " $response "}';
  }
}
