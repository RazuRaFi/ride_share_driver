import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/common_screen/Onboarding/Onboarding_screen.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateAfterDelay();
  }

  void navigateAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    Get.to(OnboardingScreen());


  }
}
