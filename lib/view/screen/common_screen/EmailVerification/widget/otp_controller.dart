import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

  RxInt resendSeconds = 30.obs;
  Timer? _timer;
  RxBool canResend = false.obs;

  @override
  void onInit() {
    startResendTimer();
    super.onInit();
  }

  void startResendTimer() {
    canResend.value = false;
    resendSeconds.value = 30;

    _timer?.cancel(); // Cancel previous timer if any
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value == 0) {
        timer.cancel();
        canResend.value = true;
      } else {
        resendSeconds.value--;
      }
    });
  }

  Future<void> resendOtp() async {
    if (!canResend.value) return;

    // Call your resend OTP API here
    print("🔁 OTP resent");

    // Restart the timer
    startResendTimer();
  }



  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
