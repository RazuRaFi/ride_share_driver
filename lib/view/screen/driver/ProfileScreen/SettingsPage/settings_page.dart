
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/Profile/profile_controller.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

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
        title: CommonText(text: "Settings",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),

      body: Padding(
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
                   CommonText(text: "Language",fontSize: 14,fontWeight: FontWeight.w500,)
                  ],
                ),
                Obx(() => DropdownButton<String>(
                  value: controller.selectedLanguage.value,
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.changeLanguage(newValue);
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
                  CommonText(text: "Change Password"),
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
                          height: 140,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonText(
                                text: "Do you want to delete?",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CommonButton(
                                    titleText: 'Yes',
                                    backgroundColor: Colors.black,
                                    buttonHeight: 45,
                                    buttonWidth: 120,
                                    titleSize: 14,
                                    onTap: () {
                                      // Add logout logic here
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CommonButton(
                                    titleText: 'No',
                                    backgroundColor: Colors.white,
                                    buttonHeight: 45,
                                    buttonWidth: 120,
                                    borderColor: Colors.black,
                                    titleColor: Colors.black,
                                    titleSize: 14,
                                    onTap: () {
                                      Navigator.of(context).pop();
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

            }, child:CommonText(text: "Delete Account",fontSize: 16,fontWeight: FontWeight.w500,color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
