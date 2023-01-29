import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/module/following_module/view/game_screen.dart';
import 'package:footballalert/utils/const.dart';
import 'package:footballalert/widgets/custom_appbar.dart';
import 'package:footballalert/widgets/custom_text.dart';
import 'package:footballalert/widgets/floating_call_button.dart';
import 'package:get/get.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key, required this.title});
  final String title;

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: HomeAppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Properties.commonHorizontalPadding),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              text: 'Match Schedules',
              size: 18.sp,
              weight: FontWeight.w700,
              color: Palette.black,
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const GameScreen());
                    },
                    child: Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 155, 155)
                            .withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Home  \nvs \nAway',
                          size: 15.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                          maxLine: 3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 150.h,
                    width: 150.h,
                    decoration: BoxDecoration(
                      color: Palette.grey.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Team 3 \nvs \nTeam 4',
                        size: 15.sp,
                        weight: FontWeight.w700,
                        color: Palette.black,
                        maxLine: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 150.h,
                    width: 150.h,
                    decoration: BoxDecoration(
                      color: Palette.grey.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Team 5 \nvs \nTeam 6',
                        size: 15.sp,
                        weight: FontWeight.w700,
                        color: Palette.black,
                        maxLine: 3,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingCallButton(),
    );
  }
}
