import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/SettingController/change_password.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/view/screen/common_screen/ForgottenPassword/forgottern_password.dart';

import '../../../../../component/CommonText.dart';
import '../../../../../component/button/CommonButton.dart';
import '../../../../../component/text_field/custom_textfield.dart';

class CreatePassword extends StatefulWidget {
  CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  GlobalKey<FormState> myKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CommonText(
          text: "Create New Password",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (controller) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: myKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),

                    CommonText(
                      text: "Current Password",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: controller.currentPasswordController,
                      hindText: "Enter current password",
                      fieldBorderRadius: 10,
                      textStyle:  TextStyle(fontSize: 14),
                      isPassword: true,
                    ),

                    SizedBox(height: 16),

                    /// New Password
                    CommonText(
                      text: "New Password",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: controller.newPasswordController,
                      hindText: "Enter new password",
                      fieldBorderRadius: 10,
                      textStyle: TextStyle(fontSize: 14),
                      isPassword: true,
                    ),

                    SizedBox(height: 16),

                    /// Confirm Password
                    CommonText(
                      text: "Confirm Password",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: controller.confirmPasswordController,
                      hindText: "Enter confirm password",
                      fieldBorderRadius: 10,
                      textStyle:  TextStyle(fontSize: 14),
                      isPassword: true,
                    ),

                    SizedBox(height: 10),

                    /// Forgot password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() =>  ForgottenPassword());
                        },
                        child: CommonText(
                          text: "Forgot Password?",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 100),

                    /// Save Button
                    CommonButton(
                      onTap: () {
                        if(myKey.currentState!.validate()){
                          controller.changePasswordRepo();
                        }

                      },
                      titleText: "Save",
                      buttonHeight: 56,
                      buttonWidth: double.infinity,
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      titleSize: 18,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
