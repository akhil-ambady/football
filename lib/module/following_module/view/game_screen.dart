import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/utils/const.dart';
import 'package:footballalert/widgets/custom_appbar.dart';
import 'package:footballalert/widgets/custom_text.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool letterVisible = false;
  bool letterVisible1 = false;
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
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      letterVisible1 = true;
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
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: 'Home vs Away',
                size: 18.sp,
                weight: FontWeight.w700,
                color: Palette.black,
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: '     ',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    color: Palette.black,
                  ),
                  CustomText(
                    text: 'Home',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    color: Palette.black,
                  ),
                  CustomText(
                    text: 'Away',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    color: Palette.black,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'Score',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    color: Palette.black,
                  ),
                  CustomText(
                    text: '  2  ',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    color: Palette.black,
                  ),
                  CustomText(
                    text: '  0  ',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    color: Palette.black,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Visibility(
                visible: letterVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: 'Score',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '  3  ',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '  0  ',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Visibility(
                visible: letterVisible1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: 'Score',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '  3  ',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                    CustomText(
                      text: '  1  ',
                      size: 15.sp,
                      weight: FontWeight.w500,
                      color: Palette.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
