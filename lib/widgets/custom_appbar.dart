import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/module/notification_module/view/notification_screen.dart';
import 'package:footballalert/utils/const.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Football'),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(const NotificationScreen());
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: const Icon(Icons.notifications_active),
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: Palette.red,
    );
  }
}
