
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/Profile/profile_controller.dart';
import 'package:ride_share_flat/controller/SettingController/change_password.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/CommonTextField.dart';

import '../../../../component/button/CommonButton.dart';
import 'CreateNewPassword/create_new_password.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller=Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: AppString.settings,fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),

      body: GetBuilder<ChangePasswordController>(
          init: ChangePasswordController(),
          builder: (deleteController){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.language),
                      SizedBox(width: 8),
                      CommonText(text: AppString.language,fontSize: 14,fontWeight: FontWeight.w500,)
                    ],
                  ),
                  Obx(() => DropdownButton<String>(
                    value: controller.selectedLanguage.value,
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.changeLanguage(newValue);
                        if (newValue == "English") {
                          Get.updateLocale(Locale('en', 'US'));
                        } else if (newValue == "Spanish") {
                          Get.updateLocale(Locale('es', 'ES'));
                        } else if (newValue == "French") {
                          Get.updateLocale(Locale('fr', 'FR'));
                        } else if (newValue == "Creole") {
                          Get.updateLocale(Locale('ht', 'HT'));
                        }
                        log("language=========$newValue}");
                      }
                    },
                    items: controller.languages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(text: AppString.changePassword.tr),
                    IconButton(onPressed: (){
                      Get.to(()=>CreatePassword());
                    }, icon: Icon(Icons.arrow_forward_ios_outlined,size: 16,)),

                  ],
                ),
              ),
              TextButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            height: 220,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonText(
                                  text: AppString.wantDelete,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                    flex: 5,
                                    child: CommonTextField(
                                      controller: deleteController.passwordController,
                                        title: AppString.enterYouPassword)),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonButton(
                                      titleText: AppString.yes,
                                      backgroundColor: Colors.black,
                                      buttonHeight: 45,
                                      buttonWidth: 120,
                                      titleSize: 14,
                                      onTap: () {
                                        deleteController.deleteAccountRepo();
                                      },
                                    ),
                                    CommonButton(
                                      titleText: AppString.no,
                                      backgroundColor: Colors.white,
                                      buttonHeight: 45,
                                      buttonWidth: 120,
                                      borderColor: Colors.black,
                                      titleColor: Colors.black,
                                      titleSize: 14,
                                      onTap: () {
                                        Get.back();

                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                  }, child:CommonText(text: AppString.deleteAccount,fontSize: 16,fontWeight: FontWeight.w500,color: Colors.red,))
            ],
          ),
        );
      }),
    );
  }
}
