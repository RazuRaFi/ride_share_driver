

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class SignInController extends GetxController{
  RxBool isLoading=false.obs;
  RxBool isRemembered = false.obs;
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  void toggleRemembered(bool value) {
    isRemembered.value = value;
  }

  Future<void> signInUser() async {

    isLoading(true);

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await ApiService.postApi(
      AppUrls.signIn,
      body,
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      var data = response.body;

      PrefsHelper.token = data['data']["accessToken"];
      PrefsHelper.userId = data['data']["user"]["_id"];
      PrefsHelper.myImage = data['data']["user"]["profileImage"]??"";
      PrefsHelper.myName = data['data']["user"]["fullName"];
      PrefsHelper.myRole = data['data']["user"]["role"];
      PrefsHelper.myEmail = data['data']["user"]["email"];
      PrefsHelper.isLogIn = true;

      PrefsHelper.setString('token', PrefsHelper.token);
      PrefsHelper.setString("userId", PrefsHelper.userId);
      PrefsHelper.setString("myImage", PrefsHelper.myImage);
      PrefsHelper.setString("myName", PrefsHelper.myName);
      PrefsHelper.setString("myEmail", PrefsHelper.myEmail);
      PrefsHelper.setString("myRole", PrefsHelper.myRole);
      PrefsHelper.setBool("isLogIn", PrefsHelper.isLogIn);

      log("PrefsHelper.token ${PrefsHelper.token}");

      Get.offAllNamed(AppRoutes.navBarScreen);

      emailController.clear();
      passwordController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading(false);
  }
}