

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../helpers/app_routes.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';
import '../../utils/app_utils.dart';

class SignUpController extends GetxController{
  RxBool isRemembered = false.obs;
  String signUpToken="";
  RxBool isLoading=false.obs;
  final TextEditingController fullNameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController licenseController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPassController=TextEditingController();

  void toggleRemembered(bool value) {
    isRemembered.value = value;
  }

  signUpUser() async {
    isLoading(true);

    Map<String, String> body = {
      "fullName": fullNameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "licenseNumber":licenseController.text,
      "password": passwordController.text,
      "termsAndConditions":isRemembered.toString()
    };

    var response = await ApiService.postApi(
      AppUrls.signUp,
      body,
    );

    if (response.statusCode == 200) {
      var data = response.body;
      signUpToken = data['data']['accessToken'];
      Get.offNamed(AppRoutes.navBarScreen);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
    isLoading(false);
  }
}