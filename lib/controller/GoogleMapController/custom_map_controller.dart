
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../utils/app_icons.dart';

class CustomMapController extends GetxController {

  static CustomMapController get instance => Get.put(CustomMapController());
  // Current location of the user
  var currentLocation = const LatLng(0, 0).obs;
  RxString currentAddress = "".obs;

  // Selected location (where the user taps on the map)
  var selectedLocation = const LatLng(0.0, 0.0).obs;

  // Source and destination for the route (demo data)
  var sourceLocation = const LatLng(0, 0).obs; // Dhaka, Bangladesh (demo source)
  var destinationLocation = const LatLng(0, 0).obs; // Slightly offset (demo destination)

  // Selected address as a string
  var selectedAddress = ''.obs;

  // List of markers (selected location, nearby drivers, source, destination)
  var markers = <Marker>[].obs;


  var driverHomeMarker = <Marker>[].obs;
  final Set<Circle> driverCircles = {};


  // Polylines for the route
  var polylines = <Polyline>[].obs;

  // Google Map Controller
  GoogleMapController? mapController;

  // Marker icons
  BitmapDescriptor? locationMarkerIcon; // For current/selected location
  // BitmapDescriptor? electricBikeIcon; // For nearby drivers
  BitmapDescriptor? motorbikeIcon; // For nearby drivers
  BitmapDescriptor? autoRickshawIcon; // For nearby drivers
  BitmapDescriptor? privateCarIcon; // For nearby drivers
  BitmapDescriptor? coveredVanIcon; // For nearby drivers
  BitmapDescriptor? sourceIcon; // For source marker
  BitmapDescriptor? destinationIcon; // For destination marker

  BitmapDescriptor? vehicleMarkerIcon; // For destination marker

  // Duration and payment method
  var duration = 0.obs; // Duration in seconds
  var selectedPaymentMethod = 'Digital Payment'.obs; // Default payment method
  RxBool isLoading = false.obs;
  String vehicleType = "";


  @override
  void onInit() {
    super.onInit();
    duration.value = 20; // Set duration to 20 seconds
    // getCurrentLocation();
    _loadMarkerIcons();
    _loadDriverMarkerIcon();
    _setDemoRoute();
  }

  @override
  void onClose() {
    // Dispose of the GoogleMapController when the controller is closed
    mapController?.dispose();
    mapController = null;
    super.onClose();
  }

  Future<void> _loadDriverMarkerIcon() async{
    privateCarIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      AppIcons.carMapIcon,
      height: 50,
      width: 100,
    );

    driverHomeMarker.add(
      Marker(
        markerId: MarkerId('driver_icon'),
        position: LatLng(23.759139, 90.429084),
        icon: privateCarIcon!,
      ),
    );
    driverCircles.add(
      Circle(
        circleId: const CircleId('driver_radius'),
        center: const LatLng(23.759405, 90.429084),
        radius: 300, // in meters
        fillColor: Colors.black12.withOpacity(0.2),
        strokeColor: Colors.green,
        strokeWidth: 1,
      ),
    );

  }

  // Load marker icons
  Future<void> _loadMarkerIcons() async {
    // Load location marker icon (AppIcons.locationMarker)
    locationMarkerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      AppIcons.locationMarker,
      height: 50,
      width: 40,
    );

    // Load electric bike icon for nearby drivers (AppIcons.electricBikeMapIcon)
    if(vehicleType == AppIcons.electricBikeIcon){
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.electricBikeMapIcon,
        height: 50,
        width: 50,
      );
    }else if(vehicleType == AppIcons.motorBikeIcon){
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.motorbikeMapIcon,
        height: 50,
        width: 60,
      );
    }else if(vehicleType == AppIcons.rickshawIcon){
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.autoRickshawMapIcon,
        height: 50,
        width: 60,
      );
    }else if(vehicleType == AppIcons.economyCarIcon){
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.carMapIcon,
        height: 50,
        width: 80,
      );
    }else if(vehicleType == AppIcons.truckIcon){
      vehicleMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(devicePixelRatio: 2.5),
        AppIcons.coveredVanMapIcon,
        height: 50,
        width: 80,
      );
    }

    // Load source icon (using a generic marker for demo)
    sourceIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      AppIcons.sourceIcon, // Reuse locationMarker for source
      height: 50,
      width: 40,
    );

    // Load destination icon (using a generic marker for demo)
    destinationIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      AppIcons.destinationIcon, // Reuse locationMarker for destination
      height: 50,
      width: 40,
    );

    // Update markers after icons are loaded
    _addNearbyDrivers();
    _addSourceDestinationMarkers();
  }

  // Get the user's current location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLocation.value = LatLng(position.latitude, position.longitude);
    log("current location: ${currentLocation.value}");
    currentAddress.value = await getAddressFromLatLng(position.latitude, position.longitude);
    selectedLocation.value = currentLocation.value;
    sourceLocation.value = currentLocation.value; // Set source as current location
    updateAddresses(position.latitude, position.longitude);

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(currentLocation.value),
      );
    }
  }

  /// Address from lat lng
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        log("Current Address:${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}");
        return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      }
      return "Address not found";
    } catch (e) {
      return "Error: $e";
    }
  }

  // Add source and destination markers
  void _addSourceDestinationMarkers() {
    if (sourceIcon == null || destinationIcon == null) return;

    markers.removeWhere((marker) => marker.markerId.value == 'source' || marker.markerId.value == 'destination');

    markers.add(
      Marker(
        markerId: const MarkerId('source'),
        position: sourceLocation.value,
        icon: sourceIcon!,
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: destinationLocation.value,
        icon: destinationIcon!,
      ),
    );
  }

  // Add nearby drivers (mock data with electric bike icons)
  void _addNearbyDrivers() {
    if (vehicleMarkerIcon == null) return;

    // Clear previous driver markers
    markers.removeWhere((marker) => marker.markerId.value.startsWith('driver_'));

    // Mock nearby driver locations (relative to selected location)
    List<LatLng> nearbyLocations = [
      LatLng(selectedLocation.value.latitude + 0.001, selectedLocation.value.longitude + 0.001),
      LatLng(selectedLocation.value.latitude - 0.001, selectedLocation.value.longitude - 0.001),
      LatLng(selectedLocation.value.latitude + 0.002, selectedLocation.value.longitude - 0.002),
      LatLng(selectedLocation.value.latitude - 0.002, selectedLocation.value.longitude + 0.002),
    ];

    for (int i = 0; i < nearbyLocations.length; i++) {
      log("VehicleMarker: $vehicleMarkerIcon");
      markers.add(
        Marker(
          markerId: MarkerId('driver_$i'),
          position: nearbyLocations[i],
          icon: vehicleMarkerIcon!,
        ),
      );
    }
  }

  // Set a demo route (mock polyline)
  void _setDemoRoute() {
    // Mock polyline points between source and destination
    List<LatLng> polylinePoints = [
      sourceLocation.value,
      LatLng(
        sourceLocation.value.latitude + (destinationLocation.value.latitude - sourceLocation.value.latitude) / 2,
        sourceLocation.value.longitude + (destinationLocation.value.longitude - sourceLocation.value.longitude) / 2,
      ),
      destinationLocation.value,
    ];

    polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        points: polylinePoints,
        color: Colors.red,
        width: 5,
      ),
    );
  }

  // Update the selected address based on latitude and longitude
  Future<void> updateAddresses(double latitude, double longitude) async {
    selectedLocation.value = LatLng(latitude, longitude);
    destinationLocation.value = selectedLocation.value; // Update destination on tap

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        selectedAddress.value =
        '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      } else {
        selectedAddress.value = 'Unknown location';
      }
    } catch (e) {
      selectedAddress.value = 'Error fetching address';
      debugPrint("Error fetching address: $e");
    }

    // Update selected location marker
    markers.removeWhere((marker) => marker.markerId.value == 'selected_location');
    markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: selectedLocation.value,
        icon: locationMarkerIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );

    // Update nearby drivers
    _addNearbyDrivers();
    // Update source and destination markers
    _addSourceDestinationMarkers();
    // Update polyline
    _setDemoRoute();

    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(selectedLocation.value),
      );
    }
  }

  // Set the Google Map Controller
  void setGoogleMapController(GoogleMapController controller) {
    mapController = controller;
  }

  // Handle setting the location as Home or Work
  void setAsHome() {
    Get.snackbar('Success', 'Location set as Home: ${selectedAddress.value}');
    Get.back(result: {'address': selectedAddress.value, 'type': 'Home'});
  }

  void setAsWork() {
    Get.snackbar('Success', 'Location set as Work: ${selectedAddress.value}');
    Get.back(result: {'address': selectedAddress.value, 'type': 'Work'});
  }
}


// var currentLocation = const LatLng(23.759139, 90.429084).obs;