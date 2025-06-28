import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/screen/driver/HomeScreen/Widget/internet_show.dart';

import '../../../../../controller/AuthController/SignInController.dart';
import '../../../../../controller/Mapcontroller/create_load_controller.dart';
import '../../../../../controller/Mapcontroller/map_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text_field/custom_textfield.dart';
import '../HomeChild/BookingScreen/FindingRides/RidersPickup/MessageScreen/message_screen.dart';
import '../HomeChild/Notifications/notifications.dart';
import 'drawer_screen.dart';

// Placeholder for RideConfirmationScreen

class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  final SignInController controller = Get.put(SignInController());
  final MapController mapController = Get.put(MapController());
  CreateLoadMapController createLoadMapController = Get.put(CreateLoadMapController());
  TextEditingController searchLocationController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Boolean to control the visibility of the Positioned container
  bool _isContainerVisible = true;
  // Boolean to control the visibility of the DraggableScrollableSheet
  bool _isBottomSheetVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      // Get.to(() => RouteScreen());
    });
  }

  @override
  void dispose() {
    searchLocationController.dispose();
    Get.delete<MapController>();
    super.dispose();
  }

  // Function to show the DraggableScrollableSheet
  void _showRideBottomSheet() {
    setState(() {
      _isBottomSheetVisible = true; // Show the DraggableScrollableSheet
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
      resizeToAvoidBottomInset: true,
      bottomSheet: Container(
        margin: const EdgeInsets.only(top: 5),
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
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: CommonImage(
                    imageSrc: AppIcons.drawermenu,
                    imageType: ImageType.png,
                    size: 24,
                  ),
                ),
                CommonText(text: "Online", fontSize: 16, fontWeight: FontWeight.w500),
                Obx(() => FlutterSwitch(
                  width: 40.0,
                  height: 20.0,
                  toggleSize: 20.0,
                  value: controller.isRemembered.value,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  toggleColor: Colors.white,
                  onToggle: (val) {
                    controller.toggleRemembered(val);
                  },
                )),
              ],
            ),
          ),
          // Conditionally show the Positioned container
          Visibility(
            visible: _isContainerVisible,
            child: Positioned(
              bottom: 34,
              left: 50,
              right: 50,
              child: Container(
                height: 247,
                width: 283,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    "assets/images/editimage.jpg",
                                    fit: BoxFit.cover,
                                    width: 48,
                                    height: 48,
                                  ),
                                ),
                              ),
                              CommonText(text: "Shihab Ahmed", fontSize: 16, fontWeight: FontWeight.w500),
                            ],
                          ),
                          Column(
                            children: [
                              CommonText(text: "\$510.00", fontSize: 16, fontWeight: FontWeight.w500),
                              CommonText(text: "3.3 km", fontSize: 16, fontWeight: FontWeight.w500),
                            ],
                          ),
                        ],
                      ),
                      Divider(thickness: 1),
                      CommonText(text: "Pick up", fontSize: 14, fontWeight: FontWeight.w400),
                      CommonText(text: "Block B, Banasree, Dhaka.", fontSize: 14, fontWeight: FontWeight.w400),
                      Divider(thickness: 1),
                      CommonText(text: "Drop out", fontSize: 14, fontWeight: FontWeight.w400),
                      CommonText(text: "Dhanmondi, Dhaka.", fontSize: 14, fontWeight: FontWeight.w400),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonButton(
                            titleText: "Decline",
                            buttonHeight: 40,
                            buttonWidth: 113,
                            borderColor: Colors.grey,
                            titleSize: 14,
                            titleColor: Colors.black,
                            onTap: () {
                              // Add Decline action logic if needed
                            },
                          ),
                          CommonButton(
                            titleText: "Accept",
                            buttonHeight: 40,
                            buttonWidth: 113,
                            backgroundColor: Colors.black,
                            titleColor: Colors.white,
                            titleSize: 14,
                            onTap: () {
                              setState(() {
                                _isContainerVisible = false; // Hide the Positioned container
                              });
                              _showRideBottomSheet(); // Show the DraggableScrollableSheet
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // DraggableScrollableSheet
          if (_isBottomSheetVisible)
            DraggableScrollableSheet(
              initialChildSize: 0.35, // Start at 35% of screen height
              minChildSize: 0.2, // Minimum 20% of screen height
              maxChildSize: 0.7, // Maximum 70% of screen height
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Optional: Add a drag handle
                        Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            width: 40,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(text: "Pickup the passenger first.",fontSize: 16,fontWeight: FontWeight.w500,),
                              SizedBox(height: 24,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        "assets/images/editimage.jpg",
                                        fit: BoxFit.cover,
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      CommonText(text: "Pick up at", fontSize: 14, fontWeight: FontWeight.w500),
                                      CommonText(text: "Block B, Banasree, Dhaka.", fontSize: 14, fontWeight: FontWeight.w500),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 24,),
                              Container(
                                alignment:Alignment.center,
                                height: 59,
                                width: 361,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        spacing: 5,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CommonText(text: "Pickup",fontSize: 14,fontWeight: FontWeight.w500,),
                                          CommonText(text: "Address: Rupatoli, Barishal",fontSize: 12,fontWeight: FontWeight.w500,),
                                        ],
                                      ),
                                      VerticalDivider(thickness: 1,),
                                      Column(
                                        spacing: 5,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CommonText(text: "Pickup",fontSize: 14,fontWeight: FontWeight.w500,),
                                          CommonText(text: "Address: Rupatoli, Barishal",fontSize: 12,fontWeight: FontWeight.w500,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 24,),
                              Row(
                                children: [
                                  Expanded(child: CustomTextField(hindText: "Send a free message",fieldBorderRadius: 60,prefixIcon: Icon(Icons.messenger),onTap: (){
                                    Get.to(()=>MessageScreen());

                                  },)),
                                  IconButton(onPressed: (){
                                    showModalBottomSheet( // ✅ Prefer `showModalBottomSheet` for better behavior
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true, // in case keyboard pops up
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context).viewInsets.bottom, // ✅ Avoids keyboard overlap
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                          ),
                                          child: SizedBox(
                                            height: 216,
                                            child: Column(
                                              children: [
                                                SizedBox(height: 50,),
                                                CustomTextField(
                                                  hindText: "Call 347 953 9042",
                                                  fieldBorderRadius: 10,
                                                  prefixIcon: Icon(Icons.call_outlined),
                                                  fieldBorderColor: Colors.grey,
                                                  textStyle: TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(height: 16,),
                                                CommonButton(
                                                  titleText: "Cancel",
                                                  buttonHeight: 56,
                                                  buttonWidth: 361,
                                                  titleSize: 14,
                                                  titleWeight: FontWeight.w500,
                                                  borderColor: Colors.grey,
                                                  titleColor: Colors.black,
                                                  backgroundColor: Colors.white,
                                                  onTap: (){
                                                    Get.back();
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                  }, icon: Icon(Icons.call_outlined,size: 40,)),
                                ],
                              ),
                              SizedBox(height: 24,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      CommonText(text: "EST",fontSize: 16,fontWeight: FontWeight.w500,),
                                      CommonText(text: "6 min",fontSize: 16,fontWeight: FontWeight.w500,),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText(text: "Distance",fontSize: 16,fontWeight: FontWeight.w500,),
                                      CommonText(text: "6 min",fontSize: 16,fontWeight: FontWeight.w500,),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText(text: "Fare",fontSize: 16,fontWeight: FontWeight.w500,),
                                      CommonText(text: "6 min",fontSize: 16,fontWeight: FontWeight.w500,),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 24,),

                              CommonButton(titleText: "Start Ride",buttonHeight: 56,buttonWidth: 361,backgroundColor: Colors.black,titleColor: Colors.white,titleSize: 20,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          Obx(() => Visibility(
            visible: controller.isRemembered.value,
            child: Positioned(
              top: 100,
              right: 0,
              left: 0,
              child: Container(
                height: 64,
                width: 393,
                decoration: BoxDecoration(),
                child: InternetShow(),
              ),
            ),
          )),
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