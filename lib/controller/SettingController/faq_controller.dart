
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../helpers/pref_helper.dart';
import '../../model/Faq/faq_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';


class FaqController extends GetxController {
  final FaqModel faqModel=FaqModel.fromJson({});
  RxBool isLoading = false.obs;
  List faqList =[];

  Future<void> getFaq() async {
    log(">>>>>>>>>>>>>>Step 1: Fetching safety data>>>>>>>>>>>>");
    isLoading(true);
    try {
      Map<String, String> headers = {
        "token": PrefsHelper.token,
      };
      var response = await ApiService.getApi(AppUrls.faq, header: headers);
      log(">>>>>>>>>>>>>>Step 3: API response received>>>>>>>>>>>>");

      if (response.body['data'] != null && response.body['data'] is List) {
        faqList = (response.body['data']['faq'] as List)
            .map((e) => FaqModel.fromJson(e))
            .toList();
        log(">>>>>>>>>>>>>>Step 4: Safety list updated with ${faqList.length} items>>>>>>>>>>>>");
      } else {
        log(">>>>>>>>>>>>>>Step 4: No data found in response>>>>>>>>>>>>");
        faqList.clear();
      }
    } catch (e) {
      log(">>>>>>>>>>>>>>Error fetching safety data: $e<<<<<<<<<<<<");
      faqList.clear();
    } finally {
      isLoading(false);
      log(">>>>>>>>>>>>>>Step 5: Loading finished>>>>>>>>>>>>");
    }
  }
}