
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share_flat/controller/AuthController/SignInController.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';
import 'package:ride_share_flat/view/screen/common_screen/ForgottenPassword/forgottern_password.dart';
import 'package:ride_share_flat/view/screen/common_screen/SignUp/SIgn_up_screen.dart';

import '../../../component/CommonTextField.dart';
import '../../../component/NavBar/common_bottom_nav.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final SignInController controller=Get.put(SignInController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 49,),
            Center(child: CommonText(text: "Welcome!", fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 16,),
            Center(child: CommonText(text: "Please Login in to continue our app", fontSize: 14, fontWeight: FontWeight.w400)),
            SizedBox(height: 56,),
            CommonText(text: "Email Address", fontSize: 14, fontWeight:FontWeight.w500),
            SizedBox(height: 7,),
            // CommonTextField(title: 'Enter your email',),
            CustomTextField(hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
            SizedBox(height: 16,),
            CommonText(text: "Password", fontSize: 14, fontWeight:FontWeight.w500),
            SizedBox(height: 7,),
            CustomTextField(hindText: "Enter your password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                children: [
                Obx(() => FlutterSwitch(
                  width: 40.0,
                  height: 20.0,
                  toggleSize: 20.0,
                  value: controller.isRemembered.value,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  toggleColor: Colors.white,
                  onToggle: (val) {
                    controller.toggleRemembered(val);
                  },
                )),
                const SizedBox(width: 5),
                  CommonText(text: "Remember Me", fontSize: 14, fontWeight: FontWeight.w400)
                          ],
                        ),
                GestureDetector(
                  onTap: (){
                    Get.to(ForgottenPassword());

                  },
                    child: CommonText(text: "Forgot Password?", fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(height: 32,),
            GestureDetector(
              onTap: (){
                Get.to(NavBarScreen());
              },
                child: CommonButton(titleText: "Sign in",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(text: "Don’t have an account? ", fontSize: 14, fontWeight:FontWeight.w400),
                TextButton(onPressed: (){
                  Get.to(()=>SignUpScreen());
                }, child:CommonText(text: "Sign up", fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black,))
              ],
            )
            



          ],
        ),
      ),

    );
  }
}


