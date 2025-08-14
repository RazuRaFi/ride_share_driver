import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/GoogleMapController/custom_map_controller.dart';
import '../../../utils/app_colors.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CustomMapController customMapController = Get.put(CustomMapController());


  TextEditingController searchLocationController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      // Get.to(() => RouteScreen());
    },);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the search controller
    searchLocationController.dispose();
    // Dispose of the MapController to clean up the GoogleMapController
    Get.delete<CustomMapController>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Handle keyboard overlap
      bottomSheet: Container(
        margin: const EdgeInsets.only(top: 5), // Prevent shadow clipping
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // locationSearchBar(
                //   searchLocationController: searchLocationController,
                //   createLoadMapController: createLoadMapController,
                //   googleApiKey: googleApiKey,
                // ),
                // const SizedBox(height: 16),
                // savedAddressBox(),
                // 24.height,
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Google Map
          Obx(() {
            return customMapController.isLoading.value == true
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: customMapController.currentLocation.value,
                zoom: 16.0,
              ),
              onMapCreated: customMapController.setGoogleMapController,
              myLocationEnabled: true,
              onTap: (argument) async {
                customMapController.updateAddresses(argument.latitude, argument.longitude);
              },
              markers: Set<Marker>.of(customMapController.markers),
              circles: customMapController.driverCircles,
            );
          }),

          // Top Bar with Back Arrow
          Positioned(
            top: 60,
            left: 20,
            child: circleIconButton(
              context,
              onTap: () {
                // Map<String, String> data = {
                //   "address": createLoadMapController.selectedAddress.value,
                //   "city": createLoadMapController.city,
                //   "state": createLoadMapController.state,
                //   "zip": createLoadMapController.zip,
                // };
                // debugPrint("Data:======>>> $data");
                // Navigator.pop(context, data);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget circleIconButton(BuildContext context, {required VoidCallback onTap, required Widget icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}