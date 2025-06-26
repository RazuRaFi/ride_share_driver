
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  color: Colors.grey.shade200,
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon:Icon(Icons.arrow_back_outlined,size: 25,color: Colors.black,)),
                      CircleAvatar(
                        radius: 25,
                        child:ClipRRect(
                          clipBehavior: Clip.none,
                          child: Image.asset("assets/images/profileimage.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(text: "Mark Willions",fontSize: 16,fontWeight: FontWeight.w500,),
                          CommonText(text: "Service Provider",fontSize: 12,fontWeight: FontWeight.w400,),
                        ],
                      )

                    ],
                  ),
                ),
                Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 84,
                      width: 327,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                          color: Colors.black
                      ),
                      child: CommonText(
                        textAlign: TextAlign.start,
                        text: "Cras eget placerat diam. Aliquam mauris libero, semper vel nisi non, suscipit.",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 84,
                          width: 327,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey
                          ),
                          child: CommonText(
                            textAlign: TextAlign.start,
                            text: "Cras eget placerat diam. Aliquam mauris libero, semper vel nisi non, suscipit.",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 64,
                          width: 327,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black
                          ),
                          child: CommonText(
                            textAlign: TextAlign.start,
                            text: "Cras eget placerat diam. Aliquam mauris libero, semper vel nisi non, suscipit.",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 84,
                          width: 327,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey
                          ),
                          child: CommonText(
                            textAlign: TextAlign.start,
                            text: "Cras eget placerat diam. Aliquam mauris libero, semper vel nisi non, suscipit.",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            Positioned(
              bottom: 10,
                left: 0,
                right: 0,
                child:Expanded(
                  child: CustomTextField(hindText: "Type something...",fieldBorderColor: Colors.grey.shade200,
                    suffixIcon: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black,
                      child: IconButton(onPressed: (){}, icon:Icon(Icons.send,color: Colors.white,size: 22,)),
                    ),),
                ))
          ],
        ),
      )
    );
  }
}
