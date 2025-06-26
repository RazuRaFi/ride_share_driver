
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../../../component/CommonText.dart';
import '../../../../../../../component/button/CommonButton.dart';
import '../../../../../../../component/text_field/custom_textfield.dart';
import 'DirverArrived/driver_arrived.dart';
import 'MessageScreen/message_screen.dart';

class RidersBottomsheet extends StatelessWidget {
  const RidersBottomsheet({super.key});

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
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Icon(Icons.circle,size: 18,color: Colors.green,),
                         CommonText(text: "Rider is on the way to pickup",fontSize: 16,fontWeight: FontWeight.w500,),
                         Container(
                           height: 25,
                           width: 60,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5),
                             color: Colors.black,

                           ),
                           child: Center(child: CommonText(text: "1 min",fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white,)),
                         )
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: CustomTextField(hindText: "Send a free message",fieldBorderRadius: 60,prefixIcon: Icon(Icons.messenger),onTap: (){
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
                      const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.mobile_friendly,size: 20,),
                                      CommonText(text: "Pay via Digital Payment",fontSize: 16,fontWeight: FontWeight.w500,)
                                    ],
                                  ),
                                  CommonText(text: "This is the estimated fare. This may Vary.",fontSize: 12,fontWeight: FontWeight.w400,)
                                ],
                              ),
                              CommonText(text: "\$60",fontSize: 18,fontWeight: FontWeight.w500,)
                            ],
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(text: "Cancel this ride?",fontSize: 14,fontWeight: FontWeight.w500,),
                              Row(children: [
                                CommonText(text: "Cancel",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.red,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 18,color: Colors.red,))
                              ],)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 48),
                      CommonButton(
                        titleText: "Choose Rides",
                        buttonHeight: 56,
                        buttonWidth: double.infinity,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        titleSize: 16,
                        onTap: () {
                          Get.to(()=>DriverArrived());
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