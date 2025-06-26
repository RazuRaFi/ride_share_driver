

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../../../../../../component/CommonText.dart';
import '../../../../../../component/button/CommonButton.dart';
import '../../../../HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/MessageScreen/message_screen.dart';

class TripDetailsOrder extends StatelessWidget {
  const TripDetailsOrder({super.key});

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
        child: SingleChildScrollView(
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
                        width: 75,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: "Distance"),
                  CommonText(text: "6.7 Km"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: "Estimated Riding Time"),
                  CommonText(text: "45 min"),
                ],
              ),
              SizedBox(height: 24,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(text: "Driver Info"),
                  SizedBox(height: 14,),
                  Row(
                    spacing: 10,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(text: "RaFiuL RaZu",fontSize: 16,fontWeight: FontWeight.w500,),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              RatingBar.builder(
                              initialRating: 3,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 1,
                              itemSize: 22,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                                VerticalDivider(thickness: 1,),
                                CommonText(text: "4.65"),
                                VerticalDivider(thickness: 1,),
                                CommonText(text: "2534 Trips"),
                                VerticalDivider(thickness: 1,),
          
                                Row(
                                  spacing: 5,
                                  children: [
                                    Image.asset("assets/icons/car.png",height: 28,width: 28,),
                                    CommonText(text: "CAR",fontSize: 14,fontWeight: FontWeight.w500,),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: CustomTextField(hindText: "Send a free message",fieldBorderRadius: 60,prefixIcon: Icon(Icons.messenger),
                        onTap: (){
                        Get.to(()=>MessageScreen());
                        },)),
                      IconButton(onPressed: (){
                        showModalBottomSheet( // ✅ Prefer `showModalBottomSheet` for better behavior
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          isScrollControlled: true, // in case keyboard pops up
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom, // ✅ Avoids keyboard overlap
                                top: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: SizedBox(
                                height: 216,
                                child: Column(
                                  children: [
                                    SizedBox(height: 50,),
                                    CustomTextField(
                                      hindText: "Call 347 953 9042",
                                      fieldBorderRadius: 10,
                                      prefixIcon: Icon(Icons.call_outlined),
                                      fieldBorderColor: Colors.grey,
                                      textStyle: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(height: 16,),
                                    CommonButton(
                                      titleText: "Cancel",
                                      buttonHeight: 56,
                                      buttonWidth: 361,
                                      titleSize: 14,
                                      titleWeight: FontWeight.w500,
                                      borderColor: Colors.grey,
                                      titleColor: Colors.black,
                                      backgroundColor: Colors.white,
                                      onTap: (){
                                        Get.back();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                      }, icon: Icon(Icons.call_outlined,size: 40,)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: "Cancel this ride?"),
                  Row(
                    children: [
                      CommonText(text: "Cancel now",color: Colors.red,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined,size: 16,color: Colors.red,)),
                    ],
                  ),
          
                ],
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
