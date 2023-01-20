import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/module/notification_module/controller/notification_screen_controller.dart';
import 'package:football/service/hive_services/offline_storage.dart';
import 'package:football/utils/const.dart';
import 'package:football/widgets/custom_appbar.dart';
import 'package:football/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    NotificationScreenController().onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: HomeAppBar()),
        body: GetBuilder<NotificationScreenController>(
          init: NotificationScreenController(), // INIT IT ONLY THE FIRST TIME
          builder: (_) => SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomText(
                        text: "Notifications",
                        size: 18.sp,
                        color: Palette.black,
                        weight: FontWeight.w700,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          NotificationScreenController()
                              .notificationList
                              ?.forEach((element) async {
                            if (!(element.isRead ?? true)) {
                              element.setIsRead = true;
                              var notificationMap = element.toJson();
                              await OfflineStorage.saveNotification(
                                  notificationMap, element.messageId ?? "");
                              if (NotificationScreenController().count.value >
                                  0) {
                                NotificationScreenController().count.value -= 1;
                              }
                              (NotificationScreenController().updateUI());
                            }
                          });
                          Clipboard.setData(ClipboardData(
                                  text: NotificationScreenController()
                                      .token
                                      .value))
                              .then((_) {});
                        },
                        child: const CustomText(
                          text: "Mark all as read",
                          size: 13,
                          color: Palette.black,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      NotificationScreenController().onInit();
                    },
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: NotificationScreenController()
                              .notificationList
                              ?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (!(NotificationScreenController()
                                        .notificationList?[index]
                                        .isRead ??
                                    true)) {
                                  NotificationScreenController()
                                      .notificationList?[index]
                                      .setIsRead = true;
                                  var notificationMap =
                                      NotificationScreenController()
                                          .notificationList?[index]
                                          .toJson();
                                  await OfflineStorage.saveNotification(
                                      notificationMap!,
                                      NotificationScreenController()
                                              .notificationList?[index]
                                              .messageId ??
                                          "");
                                  if (NotificationScreenController()
                                          .count
                                          .value >
                                      0) {
                                    NotificationScreenController()
                                        .count
                                        .value -= 1;
                                  }
                                  NotificationScreenController().updateUI();
                                }
                              },
                              child: Container(
                                color: !(NotificationScreenController()
                                            .notificationList?[index]
                                            .isRead ??
                                        true)
                                    ? Palette.white
                                    : Palette.black.withOpacity(0.2),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 10.w,
                                        width: 10.w,
                                        decoration: BoxDecoration(
                                          color:
                                              !(NotificationScreenController()
                                                          .notificationList?[
                                                              index]
                                                          .isRead ??
                                                      true)
                                                  ? Palette.black
                                                  : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            6.0.r,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 280.w,
                                                  child: CustomText(
                                                    text: NotificationScreenController()
                                                            .notificationList?[
                                                                index]
                                                            .notificationTitle ??
                                                        "",
                                                    size: 13,
                                                    color: !(NotificationScreenController()
                                                                .notificationList?[
                                                                    index]
                                                                .isRead ??
                                                            true)
                                                        ? Palette.black
                                                        : Palette.red,
                                                    weight: FontWeight.w700,
                                                    textAlign: TextAlign.start,
                                                    maxLine:
                                                        NotificationScreenController()
                                                                .isExpanded
                                                                .value
                                                            ? 3
                                                            : 1,
                                                  ),
                                                ),
                                                CustomText(
                                                  text: getFormatDate(
                                                      NotificationScreenController()
                                                              .notificationList?[
                                                                  index]
                                                              .date ??
                                                          ""),
                                                  size: 10,
                                                  color: Palette.black,
                                                  weight: FontWeight.w700,
                                                  textAlign: TextAlign.start,
                                                  opacity: 0.5,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: CustomText(
                                                    text: NotificationScreenController()
                                                            .notificationList?[
                                                                index]
                                                            .notificationSubTitle ??
                                                        "",
                                                    size: 13,
                                                    color: !(NotificationScreenController()
                                                                .notificationList?[
                                                                    index]
                                                                .isRead ??
                                                            true)
                                                        ? Palette.black
                                                        : Palette.red,
                                                    weight: FontWeight.w400,
                                                    textAlign: TextAlign.start,
                                                    maxLine: 3,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  child: SizedBox(
                                                      width: 10.w,
                                                      height: 10.h,
                                                      child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 16.h,
                                                          color:
                                                              Palette.black)),
                                                  onTap: () {
                                                    if (NotificationScreenController()
                                                            .isExpanded
                                                            .value ==
                                                        true) {
                                                      NotificationScreenController()
                                                          .isExpanded(false);
                                                    } else {
                                                      NotificationScreenController()
                                                          .isExpanded(true);
                                                    }
                                                    NotificationScreenController()
                                                        .update();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: Palette.black.withOpacity(0.2),
                              height: 1,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String getFormatDate(String? date) {
    if ((date == null) || (date.isEmpty)) {
      return "";
    }
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    if (tempDate.isToday()) {
      return "Today";
    } else if (tempDate.isYesterday()) {
      return "Yesterday";
    } else {
      var inputDate = DateTime.parse(tempDate.toString());
      var outputFormat = DateFormat('dd/MM/yy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}
