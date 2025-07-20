
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/AuthController/forgot_password_controller.dart';
import 'package:ride_share_flat/view/screen/common_screen/signIn/sign_in_screen.dart';

import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';
import '../../../component/CommonTextField.dart';
import '../../../component/text_field/custom_textfield.dart';
import '../EmailVerification/email_verification.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Create New Password ", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body:GetBuilder<ForgotPasswordController>(builder: (controller){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 42,),
                  Center(child: Image.asset("assets/images/newpassword.png",height: 100,width: 120,)),
                  SizedBox(height: 24,),
                  Center(child: CommonText(text: "Please create and enter a new password\n "
                      "                  for your account", fontSize: 14, fontWeight:FontWeight.w400)),
                  SizedBox(height: 48,),
                  CommonText(text: "Password", fontSize: 14, fontWeight: FontWeight.w500),
                  SizedBox(height: 7,),
                  CustomTextField(
                    controller: controller.passwordController,
                    hindText: "Enter new password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
                  SizedBox(height: 16,),
                  CommonText(text: "Confirm Password", fontSize: 14, fontWeight: FontWeight.w500),
                  SizedBox(height: 7,),
                  CustomTextField(
                    controller: controller.confirmPasswordController,
                    hindText: "Enter confirm password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
                  SizedBox(height: 68,),
                  GestureDetector(
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          controller.resetPasswordRepo();
                        }

                      },
                      child: CommonButton(titleText: "Save",buttonHeight: 56,buttonWidth: 360,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)),

                ],
              ),
            ),
          ),
        );
      }),

    );
  }
}
