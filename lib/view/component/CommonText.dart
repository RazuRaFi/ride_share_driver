import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    this.maxLines = 5,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.black, // Assuming AppColors.deepBlue is defined
    required this.text,
    this.style = false,
    this.overflow = TextOverflow.ellipsis,
    this.lineHeight = 1.2, // Added lineHeight parameter with a default value
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final bool style;
  final double lineHeight; // New parameter for line height

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left.w,
        right: right.w,
        top: top.h,
        bottom: bottom.h,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style == true
            ? GoogleFonts.poppins(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          decoration: TextDecoration.underline,
          decorationColor: color,
          color: color,
          height: lineHeight, // Apply line height here
        )
            : GoogleFonts.poppins(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
          height: lineHeight, // Apply line height here
        ),
      ),
    );
  }
}