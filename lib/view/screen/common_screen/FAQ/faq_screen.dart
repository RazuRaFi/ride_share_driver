
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../component/CommonText.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int index=0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Terms of Services",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24,),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text:"${index+1}",fontSize: 14,fontWeight: FontWeight.w500,),
                        Expanded(
                          child: Container(
                            child: CommonText(
                              textAlign: TextAlign.start,
                              text: "Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.",maxLines: 4,fontSize: 14,fontWeight: FontWeight.w400,),
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}