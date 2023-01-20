import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final double opacity;
  final double letterSpace;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  final int maxLine;
  final bool isShowUpperCase;
  final bool isStricked;
  final bool isItalic;
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.weight,
      this.textAlign = TextAlign.center,
      this.maxLine = 1,
      this.opacity = 1.0,
      this.letterSpace = 0,
      this.isShowUpperCase = false,
      this.isItalic = false,
      this.isStricked = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      isShowUpperCase ? text.tr.toUpperCase() : text.tr,
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.nunito(
          fontSize: size.sp,
          fontWeight: weight,
          color: color.withOpacity(opacity),
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          letterSpacing: letterSpace.sp,
          decoration:
              isStricked ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }
}
