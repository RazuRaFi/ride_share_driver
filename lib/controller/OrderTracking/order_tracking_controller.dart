
// controllers/display_controller.dart
import 'dart:developer';

import 'package:get/get.dart';
import 'package:ride_share_flat/helpers/pref_helper.dart';
import 'package:ride_share_flat/model/RideModel/get_ride_model.dart';
import 'package:ride_share_flat/services/api_services.dart';
import 'package:ride_share_flat/utils/app_urls.dart';

import '../../model/RideModel/complete_order_model.dart';
import '../../model/RideModel/complete_ride_details.dart';
import '../../model/RideModel/riders_details_model.dart';

class RideController extends GetxController {
  RideResponseModel rideResponseModel = RideResponseModel();
  CompleteDriverModel completeDriverModel=CompleteDriverModel.fromJson({});// holds the full response
  DriverDetailsModel driverDetailsModel =DriverDetailsModel.fromJson({}); // holds the full response
  CompleteRideModel completeRideModel =CompleteRideModel.fromJson({}); // holds the full response
  RxBool isPendingRide = false.obs;
  RxBool isCompleteRide = false.obs;
  RxBool isCompleteDetails = false.obs;
  RxBool isRiderDetails = false.obs;
  RxList<Ride> rideList = <Ride>[].obs;
  RxList<CompletedRide> completeList = <CompletedRide>[].obs;

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

  Future<DriverDetailsModel?> getRiderDetails() async {
    isRiderDetails(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.riderDetails, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        driverDetailsModel=DriverDetailsModel.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isRiderDetails(false);
    }

    return null;
  }

  Future<CompleteDriverModel?> getCompleteRide() async {
    isCompleteRide(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.completeRider, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        final parsedModel = CompleteDriverModel.fromJson(data);

        completeDriverModel = parsedModel;
        completeList.value = parsedModel.completed;
        return parsedModel;
      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isCompleteRide(false);
    }

    return null;
  }


  Future<CompleteRideModel?> getCompleteDetails() async {
    isCompleteDetails(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.completeDetails, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        completeRideModel=CompleteRideModel.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isCompleteDetails(false);
    }

    return null;
  }

}
