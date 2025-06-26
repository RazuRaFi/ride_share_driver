

import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:ride_share_flat/controller/Profile/profile_controller.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/text_field/common_phone_number_textfield.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController=TextEditingController();
    void countryChange(Country country) {
      print("Selected Country: ${country.name}");
      print("Dial Code: ${country.dialCode}");
      print("Country Code: ${country.code}");
    }

    final ProfileController controller =Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CommonText(text: "Edit Profile",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
          
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 127,
                      width: 128,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/editimage.jpg",
                          fit: BoxFit.cover, // Ensures it fills the circular container
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30.h,
                        left: 42.w,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 28,)))
          
                  ],
                ),
              ),
              SizedBox(height: 48,),
              CommonText(text: "Name",fontSize: 14,fontWeight: FontWeight.w400,),
              SizedBox(height: 8,),
              CustomTextField(hindText: "Name", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),),
              SizedBox(height: 18,),
              CommonText(text: "Date of Birth",fontSize: 14,fontWeight: FontWeight.w400,),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 30,
                children: [
                  Expanded(
                    flex: 3,
                      child: CustomTextField(hindText: "DD", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),)),
                  Expanded(
                    flex: 3,
                      child: CustomTextField(hindText: "Month", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),)),
                  Expanded(
                      flex: 3,
                      child: CustomTextField(hindText: "Year", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),)),
                ],
              ),
              SizedBox(height: 18,),
              CommonText(text: "Gender",fontSize: 14,fontWeight: FontWeight.w400,),
              SizedBox(height: 8,),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 5,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio<String>(
                          value: 'Male',
                          groupValue: controller.selectedGender.value,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            controller.selectedGender.value = value!;
                          },
                        ),
                      ),
                     CommonText(text: "Male",fontSize: 14,fontWeight: FontWeight.w500,)
                    ],
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          groupValue: controller.selectedGender.value,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            controller.selectedGender.value = value!;
                          },
                        ),
                        CommonText(text: "Female",fontSize: 14,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio<String>(
                          value: 'Others',
                          groupValue: controller.selectedGender.value,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            controller.selectedGender.value = value!;
                          },
                        ),
                      ),
                      CommonText(text: "Others",fontSize: 14,fontWeight: FontWeight.w500,)
                    ],
                  ),
                ],
              )),
              SizedBox(height: 18,),
              CommonText(text: "Phone Number",fontSize: 14,fontWeight: FontWeight.w400,),
              SizedBox(height: 8,),
              CommonPhoneNumberTextFiled(controller: textEditingController, countryChange: countryChange),
              SizedBox(height: 18,),
              CommonText(text: "Address",fontSize: 14,fontWeight: FontWeight.w400,),
              SizedBox(height: 8,),
              CustomTextField(hindText: "Address", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),maxLines: 3,),
              SizedBox(height: 32,),
              CommonButton(titleText: 'Save',backgroundColor: Colors.black,buttonHeight: 56,buttonWidth: 361,),
              SizedBox(height: 32,),
          
            ],
          ),
        ),
      ),
    );
  }


}
