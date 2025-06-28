
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share_flat/view/screen/common_screen/AddPayment/add-payment.dart';

import '../../../component/CommonText.dart';
import '../../../component/NavBar/common_bottom_nav.dart';
import '../../../component/button/CommonButton.dart';
import '../../../component/text_field/custom_textfield.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              Center(child: CommonText(text: "Complete Your Profile.", fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 16,),
              Center(child: CommonText(text: "Fill in your information.", fontSize: 14, fontWeight: FontWeight.w400)),
              SizedBox(height: 24,),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height:128,
                      width: 128,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(Icons.person,size: 100,color: Colors.white,),
                    ),
                    Positioned(
                      bottom: 10,
                        right: 0,
                        child:CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.black,),),
                        ))
                  ],
                ),
              ),
             
              SizedBox(height: 32,),
              CommonText(text: "Brand Name", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your name",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Add Vehicle Model", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your name",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Add Vehicle Number", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Add Vehicle Colour", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 24,),
              CommonText(text: "Upload Your Driving License picture", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              DottedBorder(
                  child:Container(
                    height: 153,
                    width: 329,
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 24,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.upload,size: 40,)),
                        CommonText(text: "Upload",fontSize: 16,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 24,),
              CommonText(text: "Upload Vehicler & Bike picture (If you have)", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              DottedBorder(
                child:Container(
                  height: 153,
                  width: 329,
                  decoration: BoxDecoration(
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 24,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.upload,size: 40,)),
                      CommonText(text: "Upload",fontSize: 16,fontWeight: FontWeight.w500,)
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24,),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder:(context){
                    return GestureDetector(
                      onTap: (){
                        Future.delayed(Duration(seconds: 3));
                        Get.offAll(()=>NavBarScreen());
                      },
                      child: Container(
                        height: 600,
                        width: 360,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/win.png",height: 106,width: 106,),
                            SizedBox(height: 19,),
                            CommonText(text: "Congratulations", fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black,),
                            SizedBox(height: 7,),
                            Center(child: CommonText(text: "Your account has been successfully registered", fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey,)),
                          ],
                        ),
                      ),
                    );
                  });
                },
                child:CommonButton(
                  onTap: (){
                    Get.to(()=>AddPayment());
                  },
                  titleText: "Next",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize:20,),),
              SizedBox(height: 32,),




            ],
          ),
        ),
      ),

    );
  }
}
