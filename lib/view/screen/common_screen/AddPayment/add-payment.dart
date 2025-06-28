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
          text: "Add Payment Method",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/stripe.png", height: 60, width: 60),
                  SizedBox(width: 10), // Replace spacing with SizedBox
                  Image.asset("assets/icons/rocket.png", height: 60, width: 60),
                  SizedBox(width: 10), // Replace spacing with SizedBox
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
              SizedBox(height: 15), // Replace spacing with SizedBox
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text: "Type"),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 60, // Constrain height to match TextFormField
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            ),
                            value: 'Personal',
                            items: <String>['Personal', 'Business'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15), // Replace spacing with SizedBox
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text: "CPF"),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 60, // Constrain height to match TextFormField
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '000 000 000 00',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Replace spacing with SizedBox
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hindText: "First name",
                      fieldBorderRadius: 10,
                      fieldBorderColor: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10), // Replace spacing with SizedBox
                  Expanded(
                    child: CustomTextField(
                      hindText: "Last name",
                      fieldBorderRadius: 10,
                      fieldBorderColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Replace spacing with SizedBox
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
      ),
    );
  }
}