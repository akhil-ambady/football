import 'package:get/get.dart';

class CartController extends GetxController {
  static final CartController _singleton = CartController._internal();

  factory CartController() {
    return _singleton;
  }

  CartController._internal();
}
