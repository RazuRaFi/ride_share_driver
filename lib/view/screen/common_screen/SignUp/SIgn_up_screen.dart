
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share_flat/view/component/NavBar/common_bottom_nav.dart';

import '../../../../controller/AuthController/Sign_up_controller.dart';
import '../../../component/button/CommonButton.dart';
import '../../../component/CommonText.dart';
import '../../../component/CommonTextField.dart';
import '../../../component/text_field/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController controller=Get.put(SignUpController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body:Obx((){
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
              :  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                    CustomTextField(
                      controller: controller.fullNameController,
                      hindText: "Enter your name",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },),
                    SizedBox(height: 16,),
                    CommonText(text: "Email", fontSize: 14, fontWeight:FontWeight.w500),
                    SizedBox(height: 7,),
                    CustomTextField(
                      controller: controller.emailController,
                      hindText: "Enter your email",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),
                    CommonText(text: "Phone Number", fontSize: 14, fontWeight:FontWeight.w500),
                    SizedBox(height: 7,),
                    CustomTextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.number,
                      hindText: "Enter your number",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Number is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),
                    CommonText(text: "Driving License ", fontSize: 14, fontWeight:FontWeight.w500),
                    SizedBox(height: 7,),
                    CustomTextField(
                      controller: controller.licenseController,
                      keyboardType: TextInputType.number,
                      hindText: "Enter your driving License ",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "License is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),
                    CommonText(text: "Password", fontSize: 14, fontWeight:FontWeight.w500),
                    SizedBox(height: 7,),
                    CustomTextField(
                      controller: controller.passwordController,
                      hindText: "Enter your password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),suffixIcon:Icon(Icons.visibility),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),
                    CommonText(text: "Confirm Password", fontSize: 14, fontWeight:FontWeight.w500),
                    SizedBox(height: 7,),
                    CustomTextField(
                      controller: controller.confirmPassController,
                      hindText: "Confirm your password",fieldBorderRadius: 10,textStyle:TextStyle(fontSize: 14),suffixIcon:Icon(Icons.visibility),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Confirm Password is required";
                        }
                        if (value !=controller.passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
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
                    CommonButton(
                      onTap: () {
                        if(formKey.currentState!.validate()){
                          controller.signUpUser();
                        }
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return GestureDetector(
                        //       onTap: () {
                        //         Get.offAll(() => NavBarScreen());
                        //       },
                        //       child: Container(
                        //         height: 600,
                        //         width: 360,
                        //         color: Colors.white,
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Image.asset("assets/images/win.png", height: 106, width: 106),
                        //             const SizedBox(height: 19),
                        //             const Text(
                        //               "Congratulations",
                        //               style: TextStyle(
                        //                 fontSize: 20,
                        //                 fontWeight: FontWeight.w500,
                        //                 color: Colors.black,
                        //                 decoration: TextDecoration.none, // <- Remove underline
                        //               ),
                        //             ),
                        //             const SizedBox(height: 7),
                        //             const Center(
                        //               child: Text(
                        //                 "Your account has been successfully registered",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.w400,
                        //                   color: Colors.black,
                        //                   decoration: TextDecoration.none, // <- Remove underline
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // );
                      },

                      titleText: "Sign up",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize:20,),
                    SizedBox(height: 32,),




                  ],
                ),
              ),
            ),
          );

        })



    );
  }
}
