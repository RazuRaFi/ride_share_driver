
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/NotificationController/notification_controller.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import 'package:ride_share_flat/helpers/others_helper.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final NotificationController controller=Get.put(NotificationController());

  @override
  void initState() {
    controller.getNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Notification",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body:Obx((){
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(hindText: "Search",prefixIcon: Icon(Icons.search),),
              SizedBox(height: 8,),
              SizedBox(height: 16,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: controller.notifyList.length,
                  itemBuilder: (context,index){
                    final notify=controller.notifyList[index];
                    return Card(
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                          child: Row(
                            spacing: 15,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               spacing: 10,
                               children: [
                                 Icon(Icons.notifications_on_outlined),
                                 Container(
                                   width: 200,
                                   child:Column(
                                     spacing: 5,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       CommonText(maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,
                                         text: notify.message.title,fontSize: 16,fontWeight: FontWeight.w500,),
                                       CommonText(
                                         maxLines: 2,textAlign: TextAlign.start,
                                         text: notify.message.text,fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey,),
                                     ],
                                   ),
                                 ),

                               ],
                             ),
                              CommonText(text: OtherHelper.formatDateAgo(notify.createdAt.toString()),fontSize: 10,),
                            ],
                          ),
                        )
                      //
                      // ListTile(
                      //   leading: Icon(Icons.notifications_on_outlined,size: 28,color: Colors.black,),
                      //   title: CommonText(text: "Payment Successful!",fontSize: 14,fontWeight: FontWeight.w500,),
                      //   subtitle: CommonText(text: "You have made a Ride Payment",fontSize: 14,fontWeight: FontWeight.w500,),
                      // )
                    );
                  })
            ],
          ),
        );
      }),
    );
  }
}
