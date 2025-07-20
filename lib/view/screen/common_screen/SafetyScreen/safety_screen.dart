

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/SettingController/saftey_controller.dart';

import '../../../component/CommonText.dart';

class SafetyScreen extends StatefulWidget {
  SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  final SafetyController safetyController=Get.put(SafetyController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    safetyController.getSafety();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CommonText(
          text: 'Safety',
          fontSize: 18,
          color:Colors.black,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp, color:Colors.black),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body:Obx(() {
        return safetyController.isloading.value
            ? const Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        )
            : safetyController.safetyData.isEmpty
            ? const Center(child: CommonText(text: "Safety Data is Empty"))
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Html(data: safetyController.safetyData.value,),
          ),
        );
      }),
    );
  }
}