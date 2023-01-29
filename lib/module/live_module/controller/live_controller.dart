import 'package:get/get.dart';

class LiveController extends GetxController {
  static final LiveController _singleton = LiveController._internal();

  factory LiveController() {
    return _singleton;
  }

  LiveController._internal();
}
