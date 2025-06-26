
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../../../component/CommonText.dart';
import '../../../../../../../component/button/CommonButton.dart';
import '../RidersPickup/riders_pickup.dart';

class FindBottomSheet extends StatelessWidget {
  const FindBottomSheet({super.key});

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
                      CommonText(
                        text: "Finding nearby rides..",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 12),
                      CommonText(
                        text: "We have sent your ride request to the nearby riders.",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 1, height: 4, color: Colors.brown),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 12,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 12,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          )
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
                              Image.asset("assets/icons/man.png", height: 20, width: 20),
                              const SizedBox(width: 5),
                              CommonText(
                                text: "Block B, Banasree, Dhaka.",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
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
                      CommonButton(
                        titleText: "Choose Rides",
                        buttonHeight: 56,
                        buttonWidth: double.infinity,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        titleSize: 16,
                        onTap: () {
                         Get.to(()=>RidersPickup());
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
