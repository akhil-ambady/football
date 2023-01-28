import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final HomeController _singleton = HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  HomeController._internal();

  Future<void> callNumber() async {
    const number = '9048658623'; //set the number here
    await FlutterPhoneDirectCaller.callNumber(number);
  }

 
}
