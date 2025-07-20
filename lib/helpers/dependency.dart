import 'package:get/get.dart';


import '../controller/AuthController/SignInController.dart';
import '../controller/AuthController/Sign_up_controller.dart';
import '../controller/Profile/profile_controller.dart';
import '../controller/SettingController/change_password.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    // Get.lazyPut(() => SettingController(), fenix: true);
    // Get.lazyPut(() => PrivacyPolicy(), fenix: true);
    // Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    // Get.lazyPut(() => HomeController(), fenix: true);
    // Get.lazyPut(() => FeedBackController(), fenix: true);
    // Get.lazyPut(() => MapController(), fenix: true);
  }
}
