

import 'package:get/get.dart';

class SignInController extends GetxController{
  RxBool isRemembered = false.obs;

  void toggleRemembered(bool value) {
    isRemembered.value = value;
  }
}