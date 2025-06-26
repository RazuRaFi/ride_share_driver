
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../../../../../../component/button/CommonButton.dart';
import 'ConfirmBokking/confirm_booking.dart';
import 'DateTimePicker/date_time_picker.dart';

class ScheduleDetails extends StatelessWidget {
  const ScheduleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Trip Details",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CommonText(text: "Select Car Type",fontSize: 16,fontWeight: FontWeight.w500,),
            SizedBox(height: 10,),
            Container(
              width: 361,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                childrenPadding: const EdgeInsets.only(bottom: 12),
                title: Row(
                  children: [
                    Image.asset(
                      'assets/icons/carmodel.png', // Your car image path
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Car Plus",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "4 Seats",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),

                // Expanded content (items)
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context,index){
                        return  Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey,  // Choose your color
                                width: 1.0,          // Choose thickness
                              ),
                            ),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              'assets/icons/carmodel.png', // Your car image path
                              height: 50,
                              width: 50,
                              fit: BoxFit.contain,
                            ),
                            title: CommonText(textAlign: TextAlign.start,
                              text: "Car Plus",fontSize: 14,fontWeight: FontWeight.w500,),
                            subtitle: CommonText(textAlign: TextAlign.start,
                              text: "Premium cars for your daily commute",fontSize: 12,fontWeight: FontWeight.w500,),
                          ),
                        );
                      })


                ],
              ),
            ),
            SizedBox(height: 20,),
            CommonText(text: "Pickup",fontSize: 16,fontWeight: FontWeight.w500,),
            SizedBox(height: 10,),
           CustomTextField(hindText: "13th Street.47 W 13th St, New York",
             textStyle: TextStyle(fontSize: 12),
             fieldBorderColor: Colors.grey,
             fillColor: Colors.white,
             prefixIcon:Icon(Icons.man),
             suffixIcon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 20,),
           ),
            SizedBox(height: 20,),
            CommonText(text: "Destinations",fontSize: 16,fontWeight: FontWeight.w500,),
            SizedBox(height: 10,),
            CustomTextField(hindText: "13th Street.47 W 13th St, New York",
              textStyle: TextStyle(fontSize: 12),
              fieldBorderColor: Colors.grey,
              fillColor: Colors.white,
              prefixIcon:Icon(Icons.location_on),
              suffixIcon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 20,),
              maxLines: 1,
            ),
            SizedBox(height: 20,),
            CustomTextField(hindText: "Enter Full Address (Optional)",
              textStyle: TextStyle(fontSize: 12),
              fieldBorderColor: Colors.grey,
              fillColor: Colors.white,
            ),
            SizedBox(height: 20,),
            CommonText(text: "Scheduler Your Ride",fontSize: 16,fontWeight: FontWeight.w500,),
            SizedBox(height: 10,),
            CustomTextField(hindText: "Select Pickup Date & Time",
              textStyle: TextStyle(fontSize: 12),
              fieldBorderColor: Colors.grey,
              fillColor: Colors.white,
              suffixIcon: IconButton(onPressed: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => CalendarBottomSheet(),
                );


              }, icon: Icon(Icons.calendar_month_outlined,size: 25,))
            ),
            SizedBox(height: 80,),

            CommonButton(
              titleText: "Check pricing",
              buttonHeight: 56,
              buttonWidth: 361,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              titleSize: 16,
              onTap: (){
                Get.to(()=>ConfirmBooking());
              },
            ),

          ],
        ),
      ),
    );
  }
}
