
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../../../../../../../component/button/CommonButton.dart';

import 'Payment/payment.dart';

class ConfirmRentCar extends StatelessWidget {
  const ConfirmRentCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              CommonText(text: "Full Name",fontSize: 14,fontWeight: FontWeight.w500,),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Name",),
              SizedBox(height: 14,),
              CommonText(text: "Email",fontSize: 14,fontWeight: FontWeight.w500,),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Santo@wer.com",),
              SizedBox(height: 14,),
              CommonText(text: "Phone Number",fontSize: 14,fontWeight: FontWeight.w500,),
              SizedBox(height: 7,),
              CustomTextField(hindText: "914-648-6469",),
              SizedBox(height: 14,),
              CommonText(text: "Driving License ",fontSize: 14,fontWeight: FontWeight.w500,),
              SizedBox(height: 7,),
              CustomTextField(hindText: "000-0000-0000",),
              SizedBox(height: 14,),
              CommonText(text: "NID",fontSize: 14,fontWeight: FontWeight.w500,),
              SizedBox(height: 7,),
              CustomTextField(hindText: "00000000000",),
              SizedBox(height: 159,),




              CommonButton(
                onTap: (){
                  Get.to(PaymentPage());
                },
                titleText: "Confirm",buttonHeight: 56,buttonWidth: 361,titleSize: 14,titleWeight: FontWeight.w500,backgroundColor: Colors.black,),
              SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
