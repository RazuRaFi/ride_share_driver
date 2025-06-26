import 'package:flutter/material.dart';

import '../../../../Map/map_screen.dart';
import 'Widget/bottomshet.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

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
            child: RideBottomSheet(),
          ),
        ],
      ),
    );
  }
}
