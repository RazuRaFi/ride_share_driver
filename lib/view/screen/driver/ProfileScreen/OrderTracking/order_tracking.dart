
import 'package:flutter/material.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

import 'CompletePage/complete_page.dart';
import 'PendingPage/pending_page.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CommonText(text:AppString.orderTracking,fontSize: 16,fontWeight: FontWeight.w500,),
          centerTitle: true,
        ),
        body: Column(
          children: [

            // Tab Bar (placed manually in the body)
            Container(
              child:TabBar(
                labelColor: Colors.black, // Selected tab text color
                unselectedLabelColor: Colors.black, // Unselected tab text color
                indicatorColor: Color(0xff990000 ),
                // Underline color
                tabs: [
                  Tab(text: AppString.pending,),
                  Tab(text: AppString.complete),
                ],
              ),
            ),

            // Tab Content (expands to fill remaining space)
            const Expanded(
              child: TabBarView(
                children: [
                  PendingPage(),
                CompletePage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
