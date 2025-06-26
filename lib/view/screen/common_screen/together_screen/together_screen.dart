
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/screen/common_screen/SignUp/SIgn_up_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/signIn/sign_in_screen.dart';

import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';

class TogetherScreen extends StatelessWidget {
  const TogetherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 197,),
          Center(
            child: Container(
              height: 233.h,
              width: 297.w,
              child: Image.asset("assets/images/together.png"),
            ),
          ),
          CommonText(text: "Let’s travel together!", fontSize: 20, fontWeight:FontWeight.w500),
          SizedBox(height: 143,),
          GestureDetector(
            onTap: (){
              Get.to(()=>SignInScreen());
            },
              child: CommonButton(titleText: "Sign In",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.white,titleColor: Colors.black,borderColor: Colors.black,titleSize: 20,)),
          SizedBox(height: 24,),
          GestureDetector(
            onTap: (){
              Get.to(SignUpScreen());
            },
              child: CommonButton(titleText: "Sign Up",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)),
        ],
      ),
    );
  }
}



