
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

import '../../../../../Map/map_screen.dart';
import 'Widget/bottomsheet.dart';

class FindingRides extends StatelessWidget {
  const FindingRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Google Map
        const Positioned.fill(child: MapScreen()),
        /// BottomSheet
        const Align(
          alignment: Alignment.bottomCenter,
          child: FindBottomSheet(),
        ),
      ],
    );
  }
}
