import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        title: CommonText(text: "Transactions Details",fontSize: 16,fontWeight: FontWeight.w500,),
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
                CommonText(text: "Full Name : ",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${transaction['name']}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Contact     :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "+123 456 789",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Email          :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "example@gmail.com",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Trip ID         :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${transaction['tripNo']}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            SizedBox(height: 24,),
            CommonText(text: "Transaction Details",fontSize: 16,fontWeight: FontWeight.w500,),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Transaction ID        :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "23155156",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "A/C Holder Name  :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${transaction['name']}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "A/C Card Number :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "91896482156",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Amount                    :",fontSize: 16,fontWeight: FontWeight.w500,),
                CommonText(text: "${NumberFormat.currency(symbol: '\$').format(transaction['amount'])}",fontSize: 14,fontWeight: FontWeight.w500,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}