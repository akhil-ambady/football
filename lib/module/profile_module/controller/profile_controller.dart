import 'package:get/get.dart';

class ProfileController extends GetxController {
  static final ProfileController _singleton = ProfileController._internal();

  factory ProfileController() {
    return _singleton;
  }

  ProfileController._internal();
}
