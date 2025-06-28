

import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class InternetShow extends StatelessWidget {
  const InternetShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.offline_bolt_outlined,size: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: "You're Offline!",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "Go online to start accepting jobs. ",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
