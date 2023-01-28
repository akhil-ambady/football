import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football/module/home_module/controller/home_controller.dart';
import 'package:football/utils/const.dart';
import 'package:football/widgets/custom_appbar.dart';
import 'package:football/widgets/custom_text.dart';
import 'package:football/widgets/floating_call_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: HomeAppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Properties.commonHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.grey.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.h),
                        CustomText(
                          text: 'Home vs Away',
                          size: 25.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                        ),
                        SizedBox(height: 15.h),
                        CustomText(
                          text: 'The critical match for AWAY !!',
                          size: 15.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                          isItalic: true,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10.sp,
                          color: Palette.red,
                        ),
                        CustomText(
                          text: ' LIVE',
                          size: 10.sp,
                          weight: FontWeight.w700,
                          color: Palette.red,
                          isItalic: false,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              CustomText(
                text: 'Featured Games',
                size: 18.sp,
                weight: FontWeight.w700,
                color: Palette.black,
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 150.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Palette.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Team 1  \nvs \nTeam 2',
                          size: 15.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                          maxLine: 3,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Palette.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                    SizedBox(width: 10.w),
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Palette.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
              ),
              SizedBox(height: 15.h),
              CustomText(
                text: 'Scores',
                size: 18.sp,
                weight: FontWeight.w700,
                color: Palette.black,
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 150.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Palette.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Team 1  \n15',
                          size: 15.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                          maxLine: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Palette.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Team 3 \n10',
                          size: 15.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                          maxLine: 2,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Palette.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Team 5 \n20',
                          size: 15.sp,
                          weight: FontWeight.w700,
                          color: Palette.black,
                          maxLine: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingCallButton(),
    );
  }
}
