
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Transaction Details",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Full Name:",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "Sabbir Hossein",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Contact   :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "+123 456 789",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Email        :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "example@gmail.com",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Trip ID      :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "#G68F78",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            SizedBox(height: 24,),
            CommonText(text: "Transaction Details",fontSize: 16,fontWeight: FontWeight.w500,),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Transaction ID       :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "23155156",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "A/C Holder Name  :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "+123 456 789",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "A/C Card Number :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "91896482156",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Amount                   :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "#G68F78",fontSize: 16,fontWeight: FontWeight.w500,),
              ],
            ),

          ],
        ),
      ),


    );
  }
}
