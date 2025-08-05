
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/OrderTracking/order_tracking_controller.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';

import '../../../../../../utils/app_urls.dart';
import '../../../../../component/CommonText.dart';
import '../../../../../component/image/common_image.dart';
import '../../../HistoryScreen/TripDetails/trip_details.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  final RideController controller=Get.put(RideController());

  @override
  void initState() {
  controller.getCompleteRide();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx((){
        return controller.isCompleteRide.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24,),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount:controller.completeList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                      final complete=controller.completeList[index];
                      return GestureDetector(
                        onTap: (){
                          Get.to(TripDetailsScreen(),arguments: complete.id);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 155,
                          width: 393,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(text:OtherHelper.formatDate(complete.endTime),fontSize: 16,fontWeight: FontWeight.w500,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Image.asset("assets/icons/man.png",height: 20,width: 20,),
                                            CommonText(text: complete.pickupLocation.address,fontSize: 14,fontWeight: FontWeight.w400,),
                                          ],
                                        ),
                                        Row(
                                          spacing: 5,
                                          children: [
                                            Image.asset("assets/icons/pin.png",height: 20,width: 20,),
                                            CommonText(text: complete.dropoffLocation.address,fontSize: 14,fontWeight: FontWeight.w400,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child:ClipOval(
                                            child: CommonImage(
                                              imageSrc:
                                              "${AppUrls.imageUrl}${complete.passenger.profileImage}",
                                              imageType: ImageType.network,
                                              fill: BoxFit.fill,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                CommonButton(titleText: AppString.viewDetails,buttonHeight: 40,buttonWidth: 332,backgroundColor: Colors.white,titleColor: Colors.black,borderColor: Colors.red,titleSize: 14,),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
