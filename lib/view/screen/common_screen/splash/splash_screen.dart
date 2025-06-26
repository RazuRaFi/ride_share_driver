

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/splash_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
 const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final SplashController controller=Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/splash.png"))
        ],
      ),

    );
  }
}
