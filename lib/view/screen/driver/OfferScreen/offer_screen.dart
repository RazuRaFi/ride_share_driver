
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/screen/driver/OfferScreen/TransactionDetails/transaction_details.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: "Wallet",fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Stack(
                children: [
                  Container(
                    height: 204,
                    width: 354,
                    child: Image.asset("assets/images/walletbanner.png",fit: BoxFit.cover,),
                  ),
                  Positioned(
                    top: 50,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                          CommonText(text: "YOUR TOTAL BALANCE",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,),
                          CommonText(text: "\$55,000.00",fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white,),
                                              ],
                                            ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.visibility,size: 30,color: Colors.white,))
                        ],
                      ))
                ],

              ),
              SizedBox(height: 10,),
              CommonText(text: "Recent Transaction",fontSize: 16,fontWeight: FontWeight.w500,),
              SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
              ),
              child: DataTable(
                columnSpacing: 12.0,
                headingRowColor: MaterialStateProperty.all(Color(0xFFBBDEFB)),
                headingRowHeight: 40,
                horizontalMargin: 20,
                columns: [
                  DataColumn(label: Text('Sl')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Trip No.')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Amount')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('01')),
                    DataCell(Text('Santiago Dslab')),
                    DataCell(Text('#G6BF78')),
                    DataCell(Text('03-07-24')),
                    DataCell(Text('\$300')),
                  ],
                    onLongPress: (){
                    Get.to(()=>TransactionDetails());
                    }

                  ),
                  DataRow(cells: [
                    DataCell(Text('01')),
                    DataCell(Text('Santiago Dslab')),
                    DataCell(Text('#G6BF78')),
                    DataCell(Text('03-07-24')),
                    DataCell(Text('\$300')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('01')),
                    DataCell(Text('Santiago Dslab')),
                    DataCell(Text('#G6BF78')),
                    DataCell(Text('03-07-24')),
                    DataCell(Text('\$300')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('01')),
                    DataCell(Text('Santiago Dslab')),
                    DataCell(Text('#G6BF78')),
                    DataCell(Text('03-07-24')),
                    DataCell(Text('\$300')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('01')),
                    DataCell(Text('Santiago Dslab')),
                    DataCell(Text('#G6BF78')),
                    DataCell(Text('03-07-24')),
                    DataCell(Text('\$300')),
                  ]),
                ],
              ),
            ),
          ),
          
            ],
          ),
        ),
      ),
    );
  }
}
