
import 'package:flutter/material.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

class OffeScreen extends StatelessWidget {
  const OffeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Offers",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: "User the promo before it expires",fontSize: 16,fontWeight: FontWeight.w500,),
              SizedBox(height: 16,),
              ListView.builder(
                shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height:125,
                  width: 361,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset("assets/icons/offfer.png",height: 35,width: 35,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            CommonText(text: "Welcome10",fontSize: 16,fontWeight: FontWeight.w500,),
                            CommonText(
                              textAlign:TextAlign.start,
                              text: "20% Discount on your next ride (up to \$10 for minimum charge of \$50.",maxLines: 2,),
                            CommonText(text: "Valid till July 05,2024"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
              SizedBox(height: 24,),
          
            ],
          ),
        ),
      ),
    );
  }
}
