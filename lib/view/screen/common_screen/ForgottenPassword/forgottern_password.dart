
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/CommonTextField.dart';
import 'package:ride_share_flat/view/screen/common_screen/EmailVerification/email_verification.dart';

import '../../../component/text_field/custom_textfield.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Forgot Password ", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42,),
              Center(child: Image.asset("assets/images/password.png",height: 100,width: 120,)),
              SizedBox(height: 24,),
              Center(child: CommonText(text: "Please enter your email address which      was used to create your account", fontSize: 14, fontWeight:FontWeight.w400)),
              SizedBox(height: 48,),
              CommonText(text: "Email Address", fontSize: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 68,),
              GestureDetector(
                onTap: (){
                  Get.to(EmailVerification());
          
                },
                  child: CommonButton(titleText: "Send OTP",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,)),
          
            ],
          ),
        ),
      ),
    );
  }
}
