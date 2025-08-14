
import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_share_flat/controller/GoogleMapController/custom_map_controller.dart';
import 'package:ride_share_flat/helpers/pref_helper.dart';
import 'package:ride_share_flat/services/socket_services.dart';

class HomeController extends GetxController{

  static HomeController get instance => Get.put(HomeController());

  int selectedIndex = 0;
  RxBool isOnline = false.obs;

  @override
  void onInit() {
    ever<LatLng>(CustomMapController.instance.currentLocation, (LatLng newLocation) {
      log("new Location: $newLocation");
      if (isOnline.value) {
        startSendingLocation(latLng: newLocation);
      }
    });
    super.onInit();
  }

  void toggleOnline(bool value) {
    isOnline.value = value;
    PrefsHelper.setBool('isOnline', value);
    if(value){
      SocketServices.connectToSocket();
      startSendingLocation(latLng: CustomMapController.instance.currentLocation.value);
    }else{
      stopSendingLocation();
      SocketServices.disconnectSocket();
    }
  }

  void select(int index) {
    selectedIndex = index;
  }

  /// Driver current location sending method
  Timer? locationTimer;
  void startSendingLocation({required LatLng latLng}) {
    // Cancel any existing timer before starting a new one
    locationTimer?.cancel();

    locationTimer = Timer.periodic(const Duration(seconds: 20), (_) {
      SocketServices.sendLocation(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
    });
  }

  void stopSendingLocation() {
    locationTimer?.cancel();
  }

  List serviceList=[
    {'image':"assets/images/service1.png", "title":"Moto Bike"},
    {'image':"assets/images/service2.png", "title":"Car"},
    {'image':"assets/images/service3.png", "title":"Rent Car"},
    {'image':"assets/images/service4.png", "title":"Schedule"},
  ];
  List scopeList=[
    {'image':"assets/icons/scope1.png", "title":"Passenger’s safety","details":"On-trip help with safety issues"},
    {'image':"assets/icons/scope1.png", "title":"First-class rides","details":"Top-rated drivers, newer cars"},
  ];
}