import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/utils/const.dart';
import 'package:footballalert/widgets/custom_appbar.dart';
import 'package:footballalert/widgets/custom_text.dart';
import 'package:footballalert/widgets/floating_call_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.title});
  final String title;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                CustomText(
                  text: 'Profile',
                  size: 25.sp,
                  weight: FontWeight.w700,
                  color: Palette.black,
                ),
                SizedBox(height: 15.h),
                Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 100.h,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.5, color: Palette.grey.withOpacity(0.2)),
                    ),
                  ),
                  child: CustomText(
                    text: 'My Bookings',
                    size: 18.sp,
                    weight: FontWeight.w400,
                    color: Palette.black,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.5, color: Palette.grey.withOpacity(0.2)),
                    ),
                  ),
                  child: CustomText(
                    text: 'My Addresses',
                    size: 18.sp,
                    weight: FontWeight.w400,
                    color: Palette.black,
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 35.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.5, color: Palette.grey.withOpacity(0.2)),
                      ),
                    ),
                    child: CustomText(
                      text: 'About Us',
                      size: 18.sp,
                      weight: FontWeight.w400,
                      color: Palette.black,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 35.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.5, color: Palette.grey.withOpacity(0.2)),
                      ),
                    ),
                    child: CustomText(
                      text: 'Gallery',
                      size: 18.sp,
                      weight: FontWeight.w400,
                      color: Palette.black,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.5, color: Palette.grey.withOpacity(0.2)),
                    ),
                  ),
                  child: CustomText(
                    text: 'Contact Us',
                    size: 18.sp,
                    weight: FontWeight.w400,
                    color: Palette.black,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.5, color: Palette.grey.withOpacity(0.2)),
                    ),
                  ),
                  child: CustomText(
                    text: 'Rate Us',
                    size: 18.sp,
                    weight: FontWeight.w400,
                    color: Palette.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingCallButton(),
    );
  }
}
