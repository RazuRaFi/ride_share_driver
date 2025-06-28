import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../component/CommonText.dart';
import '../../../component/button/CommonButton.dart';
import '../../../component/text_field/custom_textfield.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CommonText(
          text: " Add Payment Method",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 24),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/stripe.png", height: 60, width: 60),
                Image.asset("assets/icons/rocket.png", height: 60, width: 60),
                Image.asset("assets/icons/paypal.png", height: 60, width: 60),
              ],
            ),
            SizedBox(height: 24),
            CustomTextField(
              hindText: "Credit card",
              prefixIcon: Icon(Icons.credit_card),
              fieldBorderRadius: 10,
              fieldBorderColor: Colors.grey,
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomTextField(
                    hindText: "Personal",
                    fieldBorderRadius: 10,
                    fieldBorderColor: Colors.grey,
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    hindText: "000-000-00",
                    fieldBorderRadius: 10,
                    fieldBorderColor: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomTextField(
                    hindText: "First name",
                    fieldBorderRadius: 10,
                    fieldBorderColor: Colors.grey,
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    hindText: "Last name",
                    fieldBorderRadius: 10,
                    fieldBorderColor: Colors.grey,
                  ),
                ),
              ],
            ),
            CustomTextField(
              hindText: "Email",
              prefixIcon: Icon(Icons.mail),
              fieldBorderRadius: 10,
              fieldBorderColor: Colors.grey,
            ),
            SizedBox(height: 56),
            CommonButton(
              onTap: () {
                Get.to(() => AddPayment());
              },
              titleText: "Submit",
              buttonHeight: 56,
              buttonWidth: 361,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              titleSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
