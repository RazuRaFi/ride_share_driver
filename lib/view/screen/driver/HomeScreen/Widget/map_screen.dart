// All imports stay the same
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';
import 'package:ride_share_flat/view/screen/driver/HomeScreen/Widget/internet_show.dart';

import '../../../../../controller/AuthController/SignInController.dart';
import '../../../../../controller/Mapcontroller/create_load_controller.dart';
import '../../../../../controller/Mapcontroller/map_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../component/image/common_image.dart';
import '../HomeChild/BookingScreen/FindingRides/RidersPickup/MessageScreen/message_screen.dart';
import '../HomeChild/Notifications/notifications.dart';
import 'drawer_screen.dart';

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

  bool _isContainerVisible = true;
  bool _isBottomSheetVisible = false;
  bool _hasStartedRide = false; // NEW: Toggle between Start Ride and Drop Off

  @override
  void dispose() {
    searchLocationController.dispose();
    Get.delete<MapController>();
    super.dispose();
  }

  void _showRideBottomSheet() {
    setState(() {
      _isBottomSheetVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
      resizeToAvoidBottomInset: true,
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
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
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
                  onToggle: (val) => controller.toggleRemembered(val),
                )),
              ],
            ),
          ),
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const SizedBox(width: 8),
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
                    const Divider(thickness: 1),
                    CommonText(text: "Pick up", fontSize: 14, fontWeight: FontWeight.w400),
                    CommonText(text: "Block B, Banasree, Dhaka.", fontSize: 14, fontWeight: FontWeight.w400),
                    const Divider(thickness: 1),
                    CommonText(text: "Drop out", fontSize: 14, fontWeight: FontWeight.w400),
                    CommonText(text: "Dhanmondi, Dhaka.", fontSize: 14, fontWeight: FontWeight.w400),
                    const SizedBox(height: 10),
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
                          onTap: () {},
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
                              _isContainerVisible = false;
                              _showRideBottomSheet();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isBottomSheetVisible)
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        CommonText(text: "Pickup the passenger first.", fontSize: 16, fontWeight: FontWeight.w500),
                        const SizedBox(height: 24),
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
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(text: "Pick up at", fontSize: 14, fontWeight: FontWeight.w500),
                                CommonText(text: "Block B, Banasree, Dhaka.", fontSize: 14, fontWeight: FontWeight.w500),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          height: 59,
                          width:370,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(text: "Pickup", fontSize: 14, fontWeight: FontWeight.w500),
                                    CommonText(text: "Address: Rupatoli, Barishal", fontSize: 10, fontWeight: FontWeight.w500),
                                  ],
                                ),
                                VerticalDivider(thickness: 1),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(text: "Drop Off", fontSize: 14, fontWeight: FontWeight.w500),
                                    CommonText(text: "Address: Banasree, Dhaka.", fontSize: 10, fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hindText: "Send a free message",
                                fieldBorderRadius: 60,
                                prefixIcon: Icon(Icons.messenger),
                                onTap: () {
                                  Get.to(() => MessageScreen());
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  ),
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  builder: (_) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom,
                                      top: 16,
                                      left: 16,
                                      right: 16,
                                    ),
                                    child: SizedBox(
                                      height: 216,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 50),
                                          CustomTextField(
                                            hindText: "Call 347 953 9042",
                                            fieldBorderRadius: 10,
                                            prefixIcon: Icon(Icons.call_outlined),
                                            fieldBorderColor: Colors.grey,
                                            textStyle: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(height: 16),
                                          CommonButton(
                                            titleText: "Cancel",
                                            buttonHeight: 56,
                                            buttonWidth: 361,
                                            titleSize: 14,
                                            titleWeight: FontWeight.w500,
                                            borderColor: Colors.grey,
                                            titleColor: Colors.black,
                                            backgroundColor: Colors.white,
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.call_outlined, size: 40),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [CommonText(text: "EST", fontSize: 16, fontWeight: FontWeight.w500), CommonText(text: "6 min", fontSize: 16)]),
                            Column(children: [CommonText(text: "Distance", fontSize: 16, fontWeight: FontWeight.w500), CommonText(text: "2.3 km", fontSize: 16)]),
                            Column(children: [CommonText(text: "Fare", fontSize: 16, fontWeight: FontWeight.w500), CommonText(text: "\$100", fontSize: 16)]),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // ✅ Start Ride / Drop Off button
                        CommonButton(
                          titleText: _hasStartedRide ? "Drop Off" : "Start Ride",
                          buttonHeight: 56,
                          buttonWidth: double.infinity,
                          backgroundColor: Colors.black,
                          titleColor: Colors.white,
                          titleSize: 20,
                          onTap: () {
                            setState(() {
                              _hasStartedRide = !_hasStartedRide;
                            });
                          },
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
              child: SizedBox(height: 64, child: InternetShow()),
            ),
          )),
        ],
      ),
    );
  }
}
