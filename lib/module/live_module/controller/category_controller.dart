import 'package:get/get.dart';

class CategoryController extends GetxController {
  static final CategoryController _singleton = CategoryController._internal();

  factory CategoryController() {
    return _singleton;
  }

  CategoryController._internal();
}
