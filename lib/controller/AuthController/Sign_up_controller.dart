

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController{
  RxBool isRemembered = false.obs;

  void toggleRemembered(bool value) {
    isRemembered.value = value;
  }
}