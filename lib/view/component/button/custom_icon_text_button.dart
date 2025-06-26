

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CommonText.dart';

Widget customIconTextButton(
    {
      required IconData icon,
      Color iconColor = Colors.black,
      required String buttonTitle,
      Color textColor = Colors.black,
      Color buttonColor = Colors.white,
      VoidCallback? onTap,
      double borderRadius = 16,
      double margin = 0
    }
    ) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor,),
          SizedBox(width: 3,),
          CommonText(text: buttonTitle, color: textColor, fontSize: 18, fontWeight: FontWeight.w900,)
        ],
      ),
    ),
  );
}