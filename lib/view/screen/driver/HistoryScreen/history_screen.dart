
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/HistoryController/history_controller.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/screen/driver/HistoryScreen/HistoryDetails/history_details.dart';

import 'TripDetails/trip_details.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  final HistoryController historyController=Get.put(HistoryController());

  @override
  void initState() {
    historyController.getHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "History",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body:Obx((){
        return historyController.isHistoryShow.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CommonText(text: "Today",fontSize: 14,fontWeight: FontWeight.w500,),
              ),
              SizedBox(height: 16,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: historyController.historyList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    final history=historyController.historyList[index];
                    return GestureDetector(
                      onTap: (){
                        Get.to(HistoryDetailsScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 148,
                        width: 393,
                        decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(text:OtherHelper.formatDate(history.endTime),fontSize: 16,fontWeight: FontWeight.w500,),
                                  Row(
                                    children: [
                                      CommonText(text: history.netFare.toString(),fontSize: 16,fontWeight: FontWeight.w500,),
                                      Icon(Icons.arrow_forward_ios_outlined, size: 16),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.circle, size: 8, color: Colors.black),
                                          SizedBox(width: 5),
                                          CommonText(text: "PICK UP", fontSize: 14, fontWeight: FontWeight.w400,),
                                        ],
                                      ),
                                      CommonText(text: history.pickupLocation.address, fontSize: 14, fontWeight: FontWeight.w400,),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.circle, size: 8, color: Colors.black),
                                                  SizedBox(width: 5),
                                                  CommonText(text: "Drop of", fontSize: 14, fontWeight: FontWeight.w400,),
                                                ],
                                              ),
                                              CommonText(text: history.dropoffLocation.address, fontSize: 14, fontWeight: FontWeight.w400,),
                                            ],
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RatingBar.builder(
                                        initialRating:history.passengerRating.rating.toDouble(),
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                  // RatingBar on the right

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 16,),


            ],
          ),
        );
      }),
    );
  }
}
