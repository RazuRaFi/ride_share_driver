

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/screen/common_screen/ForgottenPassword/forgottern_password.dart';

import '../../../../../component/CommonText.dart';
import '../../../../../component/button/CommonButton.dart';
import '../../../../../component/text_field/custom_textfield.dart';
import '../../profile_screen.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Create New Password ", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              CommonText(text: "Current password", fontSize: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter new password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "New password", fontSize: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter confirm password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Confirm Password", fontSize: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter confirm password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(ForgottenPassword());
                    },
                      child: CommonText(text: "Forgott Password")),
                ],
              ),
              SizedBox(height: 128,),
              GestureDetector(
                  onTap: (){
                    // Get.to(EmailVerification());

                  },
                  child: CommonButton(
                    onTap: (){
                      Get.to(()=>ProfileScreen());
                    },
                    titleText: "Save",buttonHeight: 56,buttonWidth: 360,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)),

            ],
          ),
        ),
      ),

    );
  }
}
