import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';


import '../../../../../../component/CommonText.dart';
import '../../../../../../component/text_field/custom_textfield.dart';

import 'ConfirmRent/confirm_rent.dart';

class RentCarDetails extends StatelessWidget {
  const RentCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              CustomTextField(
                hindText: "13th Street.47 W 13th St, New York",
                suffixIcon: Icon(Icons.search),
                fieldBorderRadius: 10,
                prefixIcon: Icon(Icons.location_pin),
                fieldBorderColor: Colors.grey,
                textStyle: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 234,
                      width: 319,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Image.asset("assets/icons/logo.png",height: 22,width: 22,),
                              CommonText(text: "CARENT",fontSize: 14,fontWeight: FontWeight.w600,)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Container(
                              height: 61,
                              width: 167.53,
                              child: Image.asset("assets/icons/carmodel.png"),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(text: "BMW G05 ",fontSize: 18,fontWeight: FontWeight.w500,),
                                ],
                              ),
                              Row(
                                children: [
                                  CommonText(text: "\$50",fontSize: 16,fontWeight: FontWeight.w500,),
                                  CommonText(text: "/Daily",fontSize: 16,fontWeight: FontWeight.w500,),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Image.asset("assets/icons/logo.png",height: 30,width: 30,),
                            CommonText(text: "CARENT",fontSize: 18,fontWeight: FontWeight.w600,)
                          ],
                        ),
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

                        }, icon: Icon(Icons.call_outlined,size: 28,))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 24),
              CommonText(text: "Company Location",fontSize: 16,fontWeight: FontWeight.w500,),
              SizedBox(height: 8,),
              Container(
                height: 170,
                width: 151,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset("assets/images/maps.png",fit: BoxFit.cover,),
              ),
              SizedBox(height: 40,),
              GestureDetector(
            onTap: (){
              Get.to(ConfirmRentCar());
            },
                  child: CommonButton(titleText: "Book Now",buttonHeight: 56,buttonWidth: 361,titleSize: 14,titleWeight: FontWeight.w500,backgroundColor: Colors.black,)),
              SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
