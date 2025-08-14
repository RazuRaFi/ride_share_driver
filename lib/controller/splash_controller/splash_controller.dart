import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/app_routes.dart';
import '../../helpers/pref_helper.dart';
import '../GoogleMapController/custom_map_controller.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateAfterDelay();
  }

  void navigateAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    // Get.to(OnboardingScreen());
    log("token: ${PrefsHelper.token}");
    if (PrefsHelper.token.isNotEmpty) {
      Get.toNamed(AppRoutes.navBarScreen);
    } else {
      Get.offAllNamed(AppRoutes.passengerOnboarding);
    }
    CustomMapController.instance.getCurrentLocation();

  }
}
