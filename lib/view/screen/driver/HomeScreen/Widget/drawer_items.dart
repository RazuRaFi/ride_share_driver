


// Reusable Drawer Item Widget
import 'package:flutter/material.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../component/CommonText.dart';
import '../../../../component/image/common_image.dart';



class DrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final Color textColor;
  final Color ? iconColor;

  const DrawerItem({
    required this.title,
    required this.onTap,
    this.textColor = AppColors.black,
    this.iconColor ,
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Image.asset(icon,height: 20,width: 20,color:iconColor,),
          title: CommonText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}