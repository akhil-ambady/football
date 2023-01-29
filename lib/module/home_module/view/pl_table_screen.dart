import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/utils/const.dart';
import 'package:footballalert/widgets/custom_appbar.dart';
import 'package:footballalert/widgets/custom_text.dart';

class PLTableScreen extends StatefulWidget {
  const PLTableScreen({super.key});

  @override
  State<PLTableScreen> createState() => PLTableScreenState();
}

class PLTableScreenState extends State<PLTableScreen> {
  bool letterVisible = false;
  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      letterVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: HomeAppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Properties.commonHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(height: 15.h),
                Center(
                  child: Icon(
                    Icons.games_rounded,
                    size: 120.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: 'PL Table Screen',
                  size: 25.sp,
                  weight: FontWeight.w700,
                  color: Palette.black,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 1',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 1',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 2',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 2',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 3',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    !letterVisible
                        ? CustomText(
                            text: 'Team 3',
                            size: 15.sp,
                            weight: FontWeight.w500,
                            color: Palette.black,
                          )
                        : CustomText(
                            text: 'Home',
                            size: 15.sp,
                            weight: FontWeight.w500,
                            color: Palette.black,
                          ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 4',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 4',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 5',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 5',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 6',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    !letterVisible
                        ? CustomText(
                            text: 'Home',
                            size: 15.sp,
                            weight: FontWeight.w500,
                            color: Palette.black,
                          )
                        : CustomText(
                            text: 'Team 3',
                            size: 15.sp,
                            weight: FontWeight.w500,
                            color: Palette.black,
                          ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 7',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 7',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 8',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 8',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 9',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 9',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rank 10',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    const Icon(Icons.ac_unit),
                    CustomText(
                      text: 'Team 10',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
