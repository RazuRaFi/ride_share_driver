import 'package:get/get.dart';
import 'package:ride_share_flat/controller/GoogleMapController/custom_map_controller.dart';


import '../controller/AuthController/SignInController.dart';
import '../controller/AuthController/Sign_up_controller.dart';
import '../controller/HomeController/home_controller.dart';
import '../controller/Profile/profile_controller.dart';
import '../controller/SettingController/change_password.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CustomMapController(), fenix: true);
    // Get.lazyPut(() => CreateLoadMapController(), fenix: true);
    // Get.lazyPut(() => SettingController(), fenix: true);
    // Get.lazyPut(() => PrivacyPolicy(), fenix: true);
    // Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    // Get.lazyPut(() => FeedBackController(), fenix: true);
  }
}
