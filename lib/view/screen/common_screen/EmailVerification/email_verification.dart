
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:ride_share_flat/controller/AuthController/forgot_password_controller.dart';
import 'package:ride_share_flat/view/screen/common_screen/EmailVerification/widget/otp_controller.dart';

import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});
  final formKey = GlobalKey<FormState>();
  final OtpController controller = Get.put(OtpController());
  final ForgotPasswordController fController=Get.put(ForgotPasswordController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Email verification", fontSize: 16, fontWeight:FontWeight.w500),
        centerTitle: true,
      ),
      body:GetBuilder<ForgotPasswordController>(builder: (fController){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 42,),
                  Center(child: Image.asset("assets/images/password.png",height: 100,width: 120,)),
                  SizedBox(height: 24,),
                  Center(child: CommonText(
                      textAlign: TextAlign.center ,text: "Please enter the 4 digit code that was sent to\n     "
                      " xyz@gmail.com ", fontSize: 14, fontWeight:FontWeight.w400)),
                  SizedBox(height: 48,),
                  SizedBox(height: 48,),
                  OtpTextField(
                    numberOfFields:4,
                    borderColor: Colors.grey,
                    showFieldAsBox: true,
                    fieldHeight: 55,
                    fieldWidth: 55,
                    borderRadius: BorderRadius.circular(10),
                    onCodeChanged: (String code) {
                      log(">>>>>>>>>>>>>>>> $code");
                    },
                    onSubmit: (String verificationCode){
                      fController.otpController.text = verificationCode;
                    }, // end onSubmit
                  ),
                  SizedBox(height: 135,),
                  CommonButton(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        fController.verifyOtpRepo();

                      }
                    },
                    titleText: "Verify OTP",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
