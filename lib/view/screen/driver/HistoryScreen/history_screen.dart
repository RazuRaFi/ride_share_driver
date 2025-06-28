
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

import 'TripDetails/trip_details.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "History",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16),
                   child: CommonText(text: "Today",fontSize: 14,fontWeight: FontWeight.w500,),
                 ),
            SizedBox(height: 16,),
            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(TripDetailsScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 148,
                  width: 393,
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal:BorderSide(color: Colors.grey)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(text: "25 June 2024, 04:40 PM",fontSize: 16,fontWeight: FontWeight.w500,),
                            Row(
                              spacing: 5,
                              children: [
                                CommonText(text: "110",fontSize: 16,fontWeight: FontWeight.w500,),
                                Icon(Icons.arrow_forward_ios_outlined,size: 16,),
                              ],
                            )

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   CommonText(text: "Pick up",fontSize: 14,fontWeight: FontWeight.w400,),
                                   CommonText(text: "Block B, Banasree, Dhaka.",fontSize: 14,fontWeight: FontWeight.w400,),

                                 ],
                               ),
                               Divider(thickness: 1,color: Colors.black,height: 1,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       CommonText(text: "Drop of",fontSize: 14,fontWeight: FontWeight.w400,),
                                       CommonText(text: "Block B, Banasree, Dhaka.",fontSize: 14,fontWeight: FontWeight.w400,),

                                     ],
                                   ),
                                   SizedBox(
                                     child: RatingBar.builder(
                                       initialRating: 3,
                                       minRating: 0,
                                       direction: Axis.horizontal,
                                       allowHalfRating: true,
                                       itemCount: 5,
                                       itemSize: 20,
                                       itemBuilder: (context, _) => Icon(
                                         Icons.star,
                                         color: Colors.amber,
                                       ),
                                       onRatingUpdate: (rating) {
                                         print(rating);
                                       },
                                     ),
                                   ),
                                 ],
                               ),

                              ],
                            ),
                            Column(
                              children: [


                              ],
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 16,),
        
        
          ],
        ),
      ),
    );
  }
}
