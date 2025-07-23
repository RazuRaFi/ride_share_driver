
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ride_share_flat/controller/SettingController/terms_controller.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class TermsServices extends StatefulWidget {
   TermsServices({super.key});


  @override
  State<TermsServices> createState() => _TermsServicesState();
}

class _TermsServicesState extends State<TermsServices> {
 final TermsController termsController=Get.put(TermsController());
 @override
  void initState() {
    termsController.getTerms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Terms of Services",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Obx(() {
        return termsController.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        )
            : termsController.termsData.isEmpty
            ? const Center(child: CommonText(text: "Terms Data is Empty"))
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Html(data: termsController.termsData.value,),
          ),
        );
      }),
    );
  }
}
