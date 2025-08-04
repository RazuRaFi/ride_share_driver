


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

  RxString image = ''.obs;

  void getProfileImage() async {
    final picked = await OtherHelper.openGallery();
    image.value = picked ?? '';
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

  final List<String> languages = ['English', 'Spanish', 'French', 'Creole'];

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

      // Build the request body
      Map<String, dynamic> body = {
        "data": jsonEncode({
          "fullName": nameController.text,
          "dob": {
            "day": dayController.text,
            "month": monthController.text,
            "year": yearController.text,
          },
          "phone": numberController.text,
          "gender": selectedGender.value,
          "address": addressController.text,
        }),
      };

      // Send the multipart PATCH request with image
      final response = await ApiService.multipartRequest(
        url: AppUrls.updateProfile,
        body: body,
        imagePath: image.value, // ✅ use .value
        header: headers,
        method: "PATCH",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Optional: Clear fields only if needed
        nameController.clear();
        numberController.clear();
        dayController.clear();
        monthController.clear();
        yearController.clear();
        addressController.clear();
        image.value = ''; // Clear selected image

        log("Profile updated successfully");

        // Log the model
        log("Edited data: ${response.body["data"]}");
        final updatedProfile = UpdateProfileModel.fromJson(response.body["data"]);
        log("Parsed model: ${updatedProfile.profileImage}");

        // Refresh profile data
        await getMyProfile();

        Get.back();
      } else {
        log("Failed to update profile: ${response.statusCode} - ${response.body}");
      }
    } catch (e, stackTrace) {
      log("Exception occurred while updating profile: $e\n$stackTrace");
    } finally {
      isUpdateProfile(false);
    }
  }






}
