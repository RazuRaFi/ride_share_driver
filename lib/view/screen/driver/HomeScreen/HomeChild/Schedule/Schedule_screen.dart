
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/screen/driver/HomeScreen/HomeChild/Schedule/widget/schedule_sheet.dart';

import '../../../../Map/map_screen.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

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
            child: ScheduleSheet(),
          ),
        ],
      ),
    );
  }
}
