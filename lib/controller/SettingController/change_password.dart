

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/app_routes.dart';

import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';
import '../../utils/app_utils.dart';

class ChangePasswordController extends GetxController {
  bool isLoading = false;

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> changePasswordRepo() async {
    isLoading = true;
    update();
    Map<String, String> header = {"token": PrefsHelper.token};

    Map<String, String> body = {
      "oldPassword": currentPasswordController.text,
      "newPassword": newPasswordController.text,

    };
    var response = await ApiService.patchApi(
      AppUrls.changePassword,
      body: body,
      header: header,
    );

    if (response.statusCode == 200) {
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      Get.back();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }


  deleteAccountRepo() async {
    isLoading = true;
    update();
    Map<String, String> header = {
      "Authorization": PrefsHelper.token,
    };


    var body = {"password": passwordController.text};

    var response = await ApiService.deleteApi(AppUrls.delete, body: body,header: header);

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.signIn);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }
}