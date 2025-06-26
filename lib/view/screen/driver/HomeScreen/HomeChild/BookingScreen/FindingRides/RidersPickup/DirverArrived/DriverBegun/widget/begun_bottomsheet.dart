
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../../../../component/CommonText.dart';
import '../../../../../../../../../../component/button/CommonButton.dart';
import '../ConfirmPayment/confirm_payment.dart';

class BegunBottomsheet extends StatelessWidget {
  const BegunBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.circle,size: 18,color: Colors.black,),
                          CommonText(text: "Your ride has begun.",fontSize: 16,fontWeight: FontWeight.w500,),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Container(
                        height: 79,
                        width: 361,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  CommonText(text: "DHK METRO HA 64-8549",fontSize: 14,fontWeight: FontWeight.w500,),
                                  CommonText(text: "Yamaha MT 15",fontSize: 14,fontWeight: FontWeight.w500,),

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              height: double.infinity,
                              width: 87,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                              ),
                              child: Image.asset("assets/images/bike.png",fit: BoxFit.cover,),

                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 24,),
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            height:48,
                            width: 48,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)
                            ),
                            child:  Image.asset("assets/images/driver.png",height: 68,width: 68,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(text: "RaFiuL RaZu",fontSize: 16,fontWeight: FontWeight.w500,),
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  spacing: 5,
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

                                    CommonText(text: "4.65"),

                                    CommonText(text: "2534 Trips"),


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
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CommonText(
                            text: "Your Trip",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset("assets/icons/pin.png", height: 20),
                              const SizedBox(width: 5),
                              CommonText(
                                text: "Block B, Banasree, Dhaka.",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                            ],
                          ),
                          CommonText(text: "5.9 km",fontSize: 16,fontWeight: FontWeight.w500,)

                        ],
                      ),



                      const SizedBox(height: 48),
                      CommonButton(
                        titleText: "Riders Begun",
                        buttonHeight: 56,
                        buttonWidth: double.infinity,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        titleSize: 16,
                        onTap: () {
                          Get.to(()=>ConfirmPayment());
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
