

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class SignInController extends GetxController{
  RxBool isLoading=false.obs;
  RxBool isRemembered = false.obs;
  final TextEditingController emailController=TextEditingController(text: "driver2@gmail.com");
  final TextEditingController passwordController=TextEditingController(text:  "12345678");


  void toggleRemembered(bool value) {
    isRemembered.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    loadRememberMe();
  }

  Future<void> loadRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    isRemembered.value= prefs.getBool('rememberMe') ?? false;
  }

  Future<void> toggleRememberMe(bool value) async {
    isRemembered.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
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