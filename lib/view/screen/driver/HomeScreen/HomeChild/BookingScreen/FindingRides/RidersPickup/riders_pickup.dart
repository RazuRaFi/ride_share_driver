import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/widget.dart';

import '../../../../../../Map/map_screen.dart';
import '../../Widget/bottomshet.dart';

class RidersPickup extends StatelessWidget {
  const RidersPickup({super.key});

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
            child: RidersBottomsheet(),
          ),
        ],
      ),
    );
  }
}