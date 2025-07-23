
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/controller/Profile/profile_controller.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/text_field/common_phone_number_textfield.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../../../../../utils/app_urls.dart';
import '../../../../component/image/common_image.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});
   final formKey=GlobalKey<FormState>();
  final ProfileController controller =Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    void countryChange(Country country) {
      print("Selected Country: ${country.name}");
      print("Dial Code: ${country.dialCode}");
      print("Country Code: ${country.code}");

    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CommonText(text: "Edit Profile",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key:formKey,
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
                          child:
                          controller.image.isEmpty
                              ? CommonImage(
                            imageSrc:
                            AppUrls.imageUrl +
                                controller
                                    .updateProfileModel
                                    .profileImage,
                            imageType: ImageType.network,
                            height: 100,
                            width: 100,
                          )
                              : Image.file(
                            File(controller.image),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30.h,
                          left: 42.w,
                          child: IconButton(onPressed: (){
                            controller.getProfileImage();
                            }, icon: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 28,)))

                    ],
                  ),
                ),
                SizedBox(height: 48,),
                CommonText(text: "Name",fontSize: 14,fontWeight: FontWeight.w400,),
                SizedBox(height: 8,),
                CustomTextField(
                  controller:controller.nameController,
                  hindText: "Name", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),),
                SizedBox(height: 18,),
                CommonText(text: "Date of Birth",fontSize: 14,fontWeight: FontWeight.w400,),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 30,
                  children: [
                    Expanded(
                      flex: 3,
                        child: CustomTextField(
                          controller: controller.dayController,
                          hindText: "DD", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),)),
                    Expanded(
                      flex: 3,
                        child: CustomTextField(
                          controller: controller.monthController,
                          hindText: "Month", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),)),
                    Expanded(
                        flex: 3,
                        child: CustomTextField(
                          controller: controller.yearController,
                          hindText: "Year", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),)),
                  ],
                ),
                SizedBox(height: 18,),
                CommonText(text: "Gender",fontSize: 14,fontWeight: FontWeight.w400,),
                SizedBox(height: 8,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 3,
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
                CommonPhoneNumberTextFiled(controller:controller.numberController, countryChange: countryChange),
                SizedBox(height: 18,),
                CommonText(text: "Address",fontSize: 14,fontWeight: FontWeight.w400,),
                SizedBox(height: 8,),
                CustomTextField(
                  controller: controller.addressController,
                  hindText: "Address", fieldBorderRadius: 10,textStyle: TextStyle(fontSize: 14),maxLines: 3,),
                SizedBox(height: 32,),
                Obx((){
                  return controller.isUpdateProfile.value
                      ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
                      : CommonButton(
                    onTap: (){
                      controller.updateProfile();

                    },
                    titleText: 'Save',backgroundColor: Colors.black,buttonHeight: 56,buttonWidth: 361,);
                }),
                SizedBox(height: 32,),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
