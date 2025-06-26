
// controllers/display_controller.dart
import 'package:get/get.dart';

class DisplayController extends GetxController {
  var showPending = true.obs;

  void toggleDisplay(bool showPendingValue) {
    showPending.value = showPendingValue;
  }
}