
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Trip Details",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    CommonText(text: "Trip ID",fontSize: 14,fontWeight: FontWeight.w500,),
                    CommonText(text: "#GD62G",fontSize: 14,fontWeight: FontWeight.w500,),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.copy)),
                    CommonText(text: "COPY",fontSize: 14,fontWeight: FontWeight.w500,),

                  ],
                )
              ],
            ),
            SizedBox(height: 14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Trip Info",fontSize: 14,fontWeight: FontWeight.w500,),
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:2),
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        spacing: 5,
                        children: [
                          Image.asset("assets/icons/car.png",height: 28,width: 28,),
                          CommonText(text: "CAR",fontSize: 14,fontWeight: FontWeight.w500,),
                        ],
                      ),
                    ),

                  ],
                )
              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "25 June 2024, 04:40 PM",fontSize: 16,fontWeight: FontWeight.w500,),

              ],
            ),
            SizedBox(height: 14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Image.asset("assets/icons/man.png",height: 20,width: 20,),
                        CommonText(text: "Block B, Banasree, Dhaka.",fontSize: 14,fontWeight: FontWeight.w400,),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Image.asset("assets/icons/pin.png",height: 20,),
                        CommonText(text: "Block B, Banasree, Dhaka.",fontSize: 14,fontWeight: FontWeight.w400,),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 14,),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)
                      ),
                      child:  Image.asset("assets/images/driver.png",height: 48,width: 48,),
                    ),
                    CommonText(text: "RaFiuL RaZu",fontSize: 16,fontWeight: FontWeight.w500,),
                  ],
                ),
                RatingBar.builder(
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
                )

              ],
            ),
            SizedBox(height: 24,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                CommonText(text: "Receipt"),
                SizedBox(height:5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Base fare"),
                    CommonText(text: "\$6"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Distance"),
                    CommonText(text: "\$10"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Time"),
                    CommonText(text: "\$0.06"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Safety Coverage Fee"),
                    CommonText(text: "\$0.04"),
                  ],
                ),
                DottedLine(dashColor: Colors.red.shade300,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Subtotal"),
                    CommonText(text: "\$17"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Discount"),
                    CommonText(text: "-\$6"),
                  ],
                ),
                DottedLine(dashColor: Colors.red.shade300,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: "Net fare"),
                    CommonText(text: "\$11"),
                  ],
                ),

              ],
            ),
            SizedBox(height: 24,),



          ],
        ),
      ),
    );
  }
}
