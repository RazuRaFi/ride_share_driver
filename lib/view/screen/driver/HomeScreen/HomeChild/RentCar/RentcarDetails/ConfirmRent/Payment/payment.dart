
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CommonText(text: "Payment",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 24,),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/stripe.png",height: 60,width: 60,),
                Image.asset("assets/icons/rocket.png",height: 60,width: 60,),
                Image.asset("assets/icons/paypal.png",height: 60,width: 60,),
              ],
            ),
            SizedBox(height: 24,),
            CustomTextField(hindText: "Enter card holder name",prefixIcon: Icon(Icons.person_outline_sharp),fieldBorderRadius: 10,fieldBorderColor: Colors.grey,),
            CustomTextField(hindText: "Enter card holder number",prefixIcon: Icon(Icons.add_card_rounded),fieldBorderRadius: 10,fieldBorderColor: Colors.grey,),
            CustomTextField(hindText: "CVV/CVC",prefixIcon: Icon(Icons.lock_open_outlined),fieldBorderRadius: 10,fieldBorderColor: Colors.grey,),
            CustomTextField(hindText: "MM/YY",prefixIcon: Icon(Icons.credit_card),fieldBorderRadius: 10,fieldBorderColor: Colors.grey,),


          ],
        ),
      ),

    );
  }
}
