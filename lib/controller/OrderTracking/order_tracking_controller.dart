
// controllers/display_controller.dart
import 'dart:developer';

import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/pref_helper.dart';
import 'package:ride_share_flat/model/RideModel/get_ride_model.dart';
import 'package:ride_share_flat/services/api_services.dart';
import 'package:ride_share_flat/utils/app_urls.dart';

import '../../model/RideModel/complete_order_model.dart';
import '../../model/RideModel/riders_details_model.dart';

class RideController extends GetxController {
  RideResponseModel rideResponseModel = RideResponseModel(); // holds the full response
  // CompleteOrderModel completeOrderModel = CompleteOrderModel.fromJson({}); // holds the full response
  RiderDetailsModel riderDetailsModel = RiderDetailsModel(); // holds the full response
  RxBool isPendingRide = false.obs;
  RxBool isCompleteRide = false.obs;
  RxBool isRiderDetails = false.obs;
  RxList<Ride> rideList = <Ride>[].obs; // reactive ride list to use in UI
  // RxList<Complete> completeList = <Complete>[].obs; // reactive ride list to use in UI

  Future<RideResponseModel?> getPendingRide() async {
    isPendingRide(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.pendingRider, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        final parsedModel = RideResponseModel.fromJson(data);

        rideResponseModel = parsedModel;
        rideList.value = parsedModel.ride;
        return parsedModel;
      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isPendingRide(false);
    }

    return null;
  }

  Future<RiderDetailsModel?> getRiderDetails() async {
    isRiderDetails(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.riderDetails, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        riderDetailsModel=RiderDetailsModel.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isRiderDetails(false);
    }

    return null;
  }

  // Future<CompleteOrderModel?> getCompleteRide() async {
  //   isCompleteRide(true);
  //
  //   try {
  //     Map<String, String> header = {
  //       "token": PrefsHelper.token,
  //     };
  //
  //     var response = await ApiService.getApi(AppUrls.completeRider, header: header);
  //
  //     if (response.statusCode == 200) {
  //       final data = response.body['data']; // Assumes response.body is already a Map
  //
  //       final parsedModel = CompleteOrderModel.fromJson(data);
  //
  //       completeOrderModel = parsedModel;
  //       completeList.value = parsedModel.ride; // use parsedModel.ride to match model
  //       return parsedModel;
  //     }
  //   } catch (e) {
  //     log("Error fetching complete rides >>> $e");
  //   } finally {
  //     isCompleteRide(false);
  //   }
  //
  //   return null;
  // }

}
