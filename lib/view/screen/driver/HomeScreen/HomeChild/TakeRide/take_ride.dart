

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../ConfirmLocationHome/confirm_location.dart';
import '../ConfirmLocationOffice/confirm_location.dart';

class TakeRideSet extends StatelessWidget {
  const TakeRideSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Set your location ",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextField(hindText: "13th Street.47 W 13th St, New York",suffixIcon: Icon(Icons.close),fieldBorderRadius: 10,prefixIcon: Icon(Icons.man),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),
            CustomTextField(hindText: "13th Street.47 W 13th St, New York",suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,prefixIcon: Icon(Icons.location_pin),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12)),
            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context,index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.history),
                      CommonText(text: "13th Street.47 W 13th St, New York",fontSize: 14,fontWeight: FontWeight.w400,),
                    ],
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.close)),
                ],
              );
            }),
            Divider(thickness: 1,color: Colors.brown,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Get.to(SetLocationHome());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200
                ),
                child:   Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Image.asset("assets/icons/homeicon.png",height: 30,width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        CommonText(text: "Home",fontSize: 14,fontWeight:FontWeight.w500),
                        CommonText(text: "Set Address",fontSize: 12,fontWeight: FontWeight.w400,),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(SetLocationOffice());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200
                ),
                child:   Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Image.asset("assets/icons/workicon.png",height: 30,width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        CommonText(text: "Work",fontSize: 14,fontWeight:FontWeight.w500),
                        CommonText(text: "Set Address",fontSize: 12,fontWeight: FontWeight.w400,),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
