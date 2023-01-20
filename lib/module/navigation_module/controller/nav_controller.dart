import 'package:get/get.dart';

class NavController extends GetxController {

  static final NavController _singleton = NavController._internal();

  factory NavController() {
    return _singleton;
  }

  NavController._internal();

  var selectTabIndex = 0;

  // method to change the bottom navigation index
  void changeTabIndex(int index) {
    selectTabIndex = index;
    update();
  }

}
