


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';

import '../../../../../../component/CommonText.dart';
import '../FindingRides/finding_rides.dart';

class RideBottomSheet extends StatelessWidget {
  const RideBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List rideList = [
      {
        "image": 'assets/images/bike.png',
        "title": "Bike",
        "subtitle": "5 mins away\nQuick and affordable ride",
        "Price": "\$110"
      },
      {
        "image": 'assets/icons/carmodel.png',
        "title": "Car",
        "subtitle": "5 mins away\nQuick and affordable ride",
        "Price": "\$210"
      },
      {
        "image": 'assets/icons/carmodel.png',
        "title": "Car",
        "subtitle": "5 mins away\nQuick and affordable ride",
        "Price": "\$250"
      },
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.4, // default height (0.0 to 1.0)
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: rideList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            rideList[index]['image'],
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CommonText(
                                      text: rideList[index]['title'],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.person, size: 18),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                CommonText(
                                  textAlign: TextAlign.start,
                                  text: rideList[index]['subtitle'],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ],
                            ),
                          ),
                          CommonText(
                            text: rideList[index]['Price'],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CommonButton(
                  titleText: "Choose bike",
                  buttonHeight: 56,
                  buttonWidth: 361,
                  backgroundColor: Colors.black,
                  titleColor: Colors.white,
                  titleSize: 16,
                  onTap: (){
                    Get.to(()=>FindingRides());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
