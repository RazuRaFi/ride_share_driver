
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/AuthController/forgot_password_controller.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';


import '../../../component/text_field/custom_textfield.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller=Get.put(ForgotPasswordController());
    final formkey=GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Forgot Password ", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body:Obx((){
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                  CustomTextField(
                    controller: controller.forgotMailController,
                    hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                    validator: (value){
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 68,),
                  GestureDetector(
                      onTap: (){
                        if(formkey.currentState!.validate()){
                          controller.forgotPasswordRepo();
                        }

                      },
                      child: CommonButton(titleText: "Send OTP",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,)),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
