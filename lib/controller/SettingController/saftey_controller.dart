import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';




class SafetyController extends GetxController {
  RxString safetyData = " ".obs;
  RxBool isloading = false.obs;

  Future<void> getSafety() async {
    isloading(true);
    try {
      Map<String, String> header = {
        "Authorization": PrefsHelper.token,
      };

      final response = await ApiService.getApi(AppUrls.safety, header: header);
      if(response.statusCode==200){
        log("safety show successfully");
        var data = response.body["data"];
        if(data != null){
          safetyData.value = data["safetyTip"];
        }
        log("data===${safetyData.value}");

      }else{
        log("Terms error");
      }

    }catch(e) {
      log(" Exception while fetching safety data: $e");
    } finally {
      isloading(false);
    }
  }
}