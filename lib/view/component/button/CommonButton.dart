

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../CommonText.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String titleText;
  final Color titleColor;
  final Color? borderColor;
  final double borderWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final bool isLoading;
  final Color backgroundColor;
  final Widget? prefixIcon; // Added prefixIcon parameter

  const CommonButton({
    this.onTap,
    required this.titleText,
    this.titleColor = Colors.white,
    this.titleSize = 24,
    this.buttonRadius = 10,
    this.titleWeight = FontWeight.w400,
    this.buttonHeight = 52,
    this.borderWidth = 1,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.borderColor,
    this.backgroundColor = Colors.white,
    this.prefixIcon, // Added to constructor
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight.h,
      width: buttonWidth.w,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: borderColor != null ? AppColors.white : backgroundColor,
              borderRadius: BorderRadius.circular(buttonRadius.r),
              border: Border.all(
                color: borderColor ?? Colors.white,
                width: borderWidth.w,
              ),
            ),
          ),
          Positioned.fill(
            child: ElevatedButton(
              onPressed: isLoading ? null : onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    SizedBox(width: 8.w),
                  ],
                  if (titleText.isNotEmpty)
                    Flexible(
                      child: Text(
                        titleText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: titleColor,
                          fontSize: titleSize.sp,
                          fontWeight: titleWeight,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}