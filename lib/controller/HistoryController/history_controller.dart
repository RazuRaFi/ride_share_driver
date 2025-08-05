
import 'dart:developer';

import 'package:get/get.dart';
import 'package:ride_share_flat/model/HistoryModel/history_details_model.dart';
import 'package:ride_share_flat/model/HistoryModel/history_model.dart';

import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class HistoryController extends GetxController{
  final HistoryModel historyModel=HistoryModel.fromJson({});
  HistoryDetailsModel historyDetailsModel=HistoryDetailsModel.fromJson({});
 RxBool isHistoryShow=false.obs;
 RxBool isHistoryDetails=false.obs;
  RxList<RideData> historyList = <RideData>[].obs;


  Future<HistoryModel?> getHistory() async {
    isHistoryShow(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.history, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        final parsedModel = HistoryModel.fromJson(data);

        historyModel == parsedModel;
        historyList.value = parsedModel.ride;
        return parsedModel;
      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isHistoryShow(false);
    }

    return null;
  }

  Future<HistoryDetailsModel?> getHistoryDetails({required String id}) async {
    isHistoryDetails(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.historyDetails(id), header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        historyDetailsModel=HistoryDetailsModel.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isHistoryDetails(false);
    }

    return null;
  }


}