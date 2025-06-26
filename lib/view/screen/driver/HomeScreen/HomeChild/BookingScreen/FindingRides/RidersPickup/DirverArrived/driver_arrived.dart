
import 'package:flutter/material.dart';

import '../../../../../../../Map/map_screen.dart';
import '../../Widget/bottomsheet.dart';
import 'Widget/arrived-bottomsheet.dart';

class DriverArrived extends StatelessWidget {
  const DriverArrived({super.key});

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
            child: ArrivedBottomsheet(),
          ),
        ],
      ),
    );
  }
}
