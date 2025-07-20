

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';
import '../../utils/app_utils.dart';

class ForgotPasswordController extends GetxController{
  final TextEditingController forgotMailController=TextEditingController();
  final TextEditingController otpController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();

  Timer? _timer;
  int start = 0;
  bool isLoadingVerify=false;
  bool isLoadingReset=false;


  String time = "";
  RxBool isLoading=false.obs;
  String signUpToken="";
  String otpVerifyToken="";
  String forgetPasswordToken="";

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 180; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";

        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> forgotPasswordRepo() async {
    isLoading(true);
    try{
      Map<String, String> headers = {
        "token": PrefsHelper.token,
      };

      Map<String, String> body = {
        "email": forgotMailController.text,
      };
      var response = await ApiService.postApi(AppUrls.forgotPassword, body,header:headers);

      if (response.statusCode == 200) {
        Utils.toastMessage(response.message);
        otpVerifyToken = response.body['data']['forgetToken'];
        Get.toNamed(AppRoutes.verifyEmail);
      } else {
        Get.snackbar(response.statusCode.toString(), response.message);
      }

    }catch(e){
      log(">>>>>>>>>>>>>>>>>>> $e");
    }finally{
      log(">>>>>>>>>>>>>>>>Error");
    }

    isLoading(false);
  }


  Future<void> verifyOtpRepo() async {
    isLoadingVerify = true;
    update();
    Map<String, String> headers = {
      "token":otpVerifyToken,
    };
    Map<String, String> body = {
      "otp": otpController.text
    };
    var response = await ApiService.patchApi(
        AppUrls.verifyOtp,
        body:body,
        header: headers
    );

    if (response.statusCode == 200) {
      var data = response.body;
      forgetPasswordToken = data['data'];
      Get.toNamed(AppRoutes.createPassword);
      otpController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }

  Future<void> resetPasswordRepo() async {

    isLoadingReset = true;
    update();
    Map<String, String> header = {
      "token": forgetPasswordToken,
    };

    Map<String, String> body = {
      "newPassword": passwordController.text,
      "confirmPassword":confirmPasswordController.text
    };
    var response =
    await ApiService.patchApi(AppUrls.resetPassword, body:body, header: header);

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoutes.signIn);

      otpController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }
    isLoadingReset = false;
    update();
  }

}
