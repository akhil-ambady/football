import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballalert/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function onPressed;
  final Widget? widget;
  final Color? buttonColor;

  const CustomButton({
    super.key,
    required this.text,
    this.textSize = 16,
    required this.onPressed,
    this.widget,
    this.buttonColor = const Color(0xffD62C24),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(220.w, 57.h),
          shadowColor: Colors.transparent,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), // <-- Radius
          ),
        ),
        child: widget ??
            CustomText(
              text: text,
              size: textSize,
              color: const Color(0xffFFFFFF),
              weight: FontWeight.w700,
            ),
      ),
    );
  }
}
