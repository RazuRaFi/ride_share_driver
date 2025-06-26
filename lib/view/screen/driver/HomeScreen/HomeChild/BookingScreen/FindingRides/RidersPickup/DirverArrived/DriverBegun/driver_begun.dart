
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/DirverArrived/DriverBegun/widget/begun_bottomsheet.dart';

import '../../../../../../../../Map/map_screen.dart';

class DriverBegun extends StatelessWidget {
  const DriverBegun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Google Map
          const Positioned.fill(child: MapScreen()),
          /// BottomSheet
          const Align(
            alignment: Alignment.bottomCenter,
            child: BegunBottomsheet(),
          ),
        ],
      ),
    );
  }
}
