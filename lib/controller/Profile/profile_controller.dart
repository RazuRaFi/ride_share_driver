


import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/pref_helper.dart';
import 'package:ride_share_flat/model/Profile_model/my_profile_model.dart';
import 'package:ride_share_flat/services/api_services.dart';
import 'package:ride_share_flat/utils/app_urls.dart';

import '../../helpers/others_helper.dart';
import '../../model/Profile_model/Update_profile_model.dart';
import '../../utils/app_utils.dart';

class ProfileController extends GetxController {
  ProfileDetailsModel profileDetailsModel=ProfileDetailsModel.fromJson({});
  UpdateProfileModel updateProfileModel=UpdateProfileModel.fromJson({});
  // List languages = ["English", "French", "Arabic"];
  List gender = const ["Male", "Female", "Other"];

  // String selectedLanguage = "English";
  String image="";

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxBool isGetProfile=false.obs;
  RxBool isUpdateProfile=false.obs;



  // selectedGender(int index) {
  //   genderController.text = gender[index].toString();
  //   update();
  //   Get.back();
  // }

  getProfileImage() async {
    image = await OtherHelper.openGallery()??"";
    update();
  }

  // selectLanguage(int index) {
  //   selectedLanguage = languages[index];
  //   update();
  //   Get.back();
  // }
  RxString selectedGender = ''.obs;

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  var selectedLanguage = 'English'.obs; // Observable variable for reactive updates

  final List<String> languages = ['English', 'Spanish', 'French', 'German'];

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
  }


  Future<ProfileDetailsModel?> getMyProfile() async {
    isGetProfile(true);
    try {
      Map<String, String> header = {"token": PrefsHelper.token};

      var response = await ApiService.getApi(AppUrls.myProfile, header: header);

      if (response.statusCode == 200) {
        log("Profile details fetched successfully");

        var data = response.body["data"];
        log(">>>>>>>>>>>>>>>>>> $data");
        profileDetailsModel = ProfileDetailsModel.fromJson(data);
      } else {
        log("Failed to fetch profile details: ${response.statusCode}");
      }
    } catch (e) {
      log("Exception profile details: $e");
    } finally {
      isGetProfile(false);
    }
    return null;
  }

  updateProfile() async {
    isUpdateProfile(true);
    try {

      Map<String, String> headers = {
        "token": PrefsHelper.token,
      };

      Map<String,dynamic> body = {
        "data": jsonEncode({
          "fullName": nameController.text,
          "dob": {
            "day": dayController.text,
            "month": monthController.text,
            "year": yearController.text,
          },
          "phone": numberController.text,
          "gender": selectedGender.value,
          "address":addressController.text,
        })
      };


      final response = await ApiService.multipartRequest(url: AppUrls.updateProfile, body: body,imagePath: image,header: headers,method: "PATCH");

      if (response.statusCode == 200 || response.statusCode == 201) {
        nameController.clear();
        numberController.clear();
        dayController.clear();
        monthController.clear();
        yearController.clear();
        addressController.clear();
        log("Profile updated successfully");
        log("edited data======${response.body["data"]}========================model--${UpdateProfileModel.fromJson(response.body["data"])}");
        getMyProfile();

        log("My Profile Updated====${profileDetailsModel.user.profileImage}");
        Get.back();
      } else {
        log("Failed to update profile: ${response.statusCode} - ${response.body} ");
        return null;
      }
    } catch (e, stackTrace) {
      log("Exception occurred while updating profile: $e\n$stackTrace");
      return null;
    } finally {
      isUpdateProfile(false);
    }
  }






}
