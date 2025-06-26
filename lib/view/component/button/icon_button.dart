
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';

import '../../../utils/app_colors.dart';
import '../CommonText.dart';
import '../image/common_image.dart';

Widget iconButton({required String icon, required String buttonTitle, VoidCallback? onTap, double borderRadius = 10, double margin = 0, double buttonHeight = 14, double iconSize = 26, ImageType imageType = ImageType.svg, Color btnColor = AppColors.btnColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.symmetric(vertical: buttonHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: btnColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage(imageSrc: icon, imageColor: AppColors.black, imageType: imageType, size: iconSize,),
          4.width,
          CommonText(text: buttonTitle, color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 18,)
        ],
      ),
    ),
  );
}