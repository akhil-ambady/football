import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/utils/const.dart';
import 'package:footballalert/widgets/custom_appbar.dart';
import 'package:footballalert/widgets/custom_text.dart';

class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({super.key});

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
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
                    Icons.account_circle,
                    size: 100.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: 'Player 1',
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
                      text: 'Name',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: 'Player 1',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'No. of games played',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '25',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'No. of goals',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '15',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'No. of yellow cards',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '2',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'No. of red cards',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '1',
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
