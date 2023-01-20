import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:football/module/home_module/model/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final HomeController _singleton = HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  HomeController._internal();

  var isLoadindProducts = false.obs;
  List<Products>? productList = <Products>[].obs;
  var deviceID = "".obs;

  Future<void> callNumber() async {
    const number = '9048658623'; //set the number here
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  showAlertDialog(BuildContext context, RemoteMessage message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("${message.notification?.title}"),
      content: Text("${message.notification?.body}"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
