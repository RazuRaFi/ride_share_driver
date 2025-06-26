
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Notification",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(hindText: "Search",prefixIcon: Icon(Icons.search),),
            SizedBox(height: 8,),
            CommonText(text: "Today",fontSize: 16,fontWeight: FontWeight.w500,),
            SizedBox(height: 16,),
            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context,index){
              return Card(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Row(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.notifications_on_outlined),
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(text: "Payment Successful!",fontSize: 16,fontWeight: FontWeight.w500,),
                          CommonText(text: "You have made a Ride Payment",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,),
                        ],
                      )
                    ],
                  ),
                )
                //
                // ListTile(
                //   leading: Icon(Icons.notifications_on_outlined,size: 28,color: Colors.black,),
                //   title: CommonText(text: "Payment Successful!",fontSize: 14,fontWeight: FontWeight.w500,),
                //   subtitle: CommonText(text: "You have made a Ride Payment",fontSize: 14,fontWeight: FontWeight.w500,),
                // )
              );
            })
          ],
        ),
      ),
    );
  }
}
