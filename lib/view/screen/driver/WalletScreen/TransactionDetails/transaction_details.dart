import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class TransactionDetailPage extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title: CommonText(text: AppString.transaction,fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text:"${AppString.fullName} :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${transaction['name']}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.contact}         :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "+123 456 789",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.email}              :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "example@gmail.com",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.tripId}    :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${transaction['tripNo']}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            SizedBox(height: 24,),
            CommonText(text: AppString.transaction,fontSize: 16,fontWeight: FontWeight.w500,),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.transactionId}       :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "23155156",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.acHolder}                :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${transaction['name']}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.acCard}            :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "91896482156",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "${AppString.amount}                     :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${NumberFormat.currency(symbol: '\$').format(transaction['amount'])}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}