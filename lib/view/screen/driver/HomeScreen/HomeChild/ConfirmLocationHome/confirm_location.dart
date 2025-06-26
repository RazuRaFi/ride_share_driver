





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../controller/Mapcontroller/create_load_controller.dart';
import '../../../../../../controller/Mapcontroller/map_controller.dart';
import '../../../../../../helpers/app_routes.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../component/button/CommonButton.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text_field/custom_textfield.dart';

class SetLocationHome extends StatefulWidget {
  const SetLocationHome({super.key});

  @override
  State<SetLocationHome> createState() => _SetLocationHomeState();
}

class _SetLocationHomeState extends State<SetLocationHome> {
  final MapController mapController = Get.put(MapController());
  CreateLoadMapController createLoadMapController = Get.put(
    CreateLoadMapController(),
  );

  final String googleApiKey = "AIzaSyC0hhuHPap6Wk98dZIyQdvvpoE3p-LuXhU";
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
    Get.delete<MapController>();
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
            return mapController.isLoading.value == true
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: mapController.currentLocation.value,
                zoom: 16.0,
              ),
              onMapCreated: mapController.setGoogleMapController,
              myLocationEnabled: true,
              onTap: (argument) async {
                mapController.updateAddresses(argument.latitude, argument.longitude);
              },
              markers: Set<Marker>.of(mapController.markers),
              circles: mapController.driverCircles,
            );
          }),

          // Top Bar with Back Arrow
          Positioned(
            top: 60,
            left: 20,
            child: circleIconButton(
              context,
              onTap: () {
                Map<String, String> data = {
                  "address": createLoadMapController.selectedAddress.value,
                  "city": createLoadMapController.city,
                  "state": createLoadMapController.state,
                  "zip": createLoadMapController.zip,
                };
                debugPrint("Data:======>>> $data");
                Navigator.pop(context, data);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 250,
            right: 16,
            child: circleIconButton(
              context,
              onTap: () {
                Get.toNamed(AppRoutes.safetyScreen);
              },
              icon: CommonImage(imageSrc: AppIcons.safety, size: 24,),
            ),
          ),
          Positioned(
            bottom: 320,
            right: 16,
            child: circleIconButton(
              context,
              onTap: () {
                // OfferScreen.isNotFromNavbar = true;
                // Get.toNamed(AppRoutes.offersScreen);
              },
              icon: CommonImage(imageSrc: AppIcons.offersSolid, size: 24,),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 203,
                width: 396,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 28,),
                      CustomTextField(hindText: "13th Street.47 W 13th St, New York",suffixIcon: Icon(Icons.search),fieldBorderRadius: 10,prefixIcon: Icon(Icons.location_pin),fieldBorderColor: Colors.grey,textStyle: TextStyle(fontSize: 12),),
                      SizedBox(height: 16,),
                      CommonButton(titleText: "Confirm Home Address",backgroundColor: Colors.black,titleColor: Colors.white,buttonHeight: 56,buttonWidth: 359,titleSize: 16,titleWeight: FontWeight.w500,),
                    ],
                  ),
                ),

              ))
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