
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share_flat/view/component/NavBar/common_bottom_nav.dart';
import 'package:ride_share_flat/view/screen/common_screen/CompleteProfile/complete_profile.dart';

import '../../../../controller/AuthController/Sign_up_controller.dart';
import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';
import '../../../component/CommonTextField.dart';
import '../../../component/text_field/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller=Get.put(SignUpController());
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
              Center(child: CommonText(text: "Welcome!", fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 16,),
              Center(child: CommonText(text: "Please Sign up to continue our app", fontSize: 14, fontWeight: FontWeight.w400)),
              SizedBox(height: 32,),
              CommonText(text: "Full Name", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your name",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Last Name", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your name",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Email", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Phone Number", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your number",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Driving License ", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "000-000-000",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),),
              SizedBox(height: 16,),
              CommonText(text: "Password", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Enter your password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),suffixIcon:Icon(Icons.visibility),),
              SizedBox(height: 16,),
              CommonText(text: "Confirm Password", fontSize: 14, fontWeight:FontWeight.w500),
              SizedBox(height: 7,),
              CustomTextField(hindText: "Confirm your password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),suffixIcon:Icon(Icons.visibility),),
              SizedBox(height: 32,),
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
                  CommonText(text: "Agree With Terms and Conditions", fontSize: 14, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: 32,),
              GestureDetector(
                onTap: (){
                 Get.to(()=>CompleteProfile());
                },
                  child:CommonButton(titleText: "Sign up",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize:20,),),
              SizedBox(height: 32,),
          
          
          
          
            ],
          ),
        ),
      ),

    );
  }
}
