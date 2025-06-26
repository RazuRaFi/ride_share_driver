
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/NavBar/common_bottom_nav.dart';

import '../../../../../../../component/button/CommonButton.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Confirm Booking",fontSize:16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: "Your Plus",fontSize:16,fontWeight: FontWeight.w500,),
              SizedBox(height: 24,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: 205,
                width: 361,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                          Image.asset("assets/icons/carmodel.png",height: 50,width: 50,fit: BoxFit.contain,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(text: "Car Plus",fontSize: 16,fontWeight: FontWeight.w500,),
                                CommonText(text: "4 seats",fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey,),
                              ],
                            )
                        ],),
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.red,))
                      ],
                    ),
                    Divider(thickness: 1,),
                    Row(
                      spacing: 10,
                      children: [
                        Image.asset("assets/icons/man.png",height: 25,width: 25,),
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(text: "Pickup , ${DateTime.now().toString().substring(0,16)}",color: Colors.grey,),
                            CommonText(text: "13th Street. 47 W 13th St, New York",fontSize: 14,fontWeight: FontWeight.w500,),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      spacing: 10,
                      children: [
                        Image.asset("assets/icons/pin.png",height: 25,width: 25,),
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(text: "Destinations",color: Colors.grey,),
                            CommonText(text: "13th Street.47 W 13th St, New York",fontSize: 14,fontWeight: FontWeight.w500,),
                          ],
                        )
                      ],
                    ),
          
                  ],
                ),
              ),
              SizedBox(height: 300,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.mobile_friendly,color: Colors.green,size: 20,),
                          CommonText(text: "Pay via Digital Payment",fontSize: 16,fontWeight: FontWeight.w500,)
                        ],
                      ),
                      CommonText(text: "This is the estimated fare. This may Vary.",fontSize: 12,fontWeight: FontWeight.w400,),
                    ],
                  ),
                  CommonText(text: "\$150",fontSize: 16,fontWeight: FontWeight.w500,)
                ],
              ),
              SizedBox(height: 24,),
              CommonButton(
                titleText: "Confirm Order",
                buttonHeight: 56,
                buttonWidth: 361,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                titleSize: 16,
                onTap: (){
                  Get.to(()=>NavBarScreen());
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
