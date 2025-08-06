import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:ride_share_flat/controller/WalletController/wallet_controller.dart';
import 'package:ride_share_flat/utils/app_string.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';

import 'TransactionDetails/transaction_details.dart';

void main() {
  runApp(const MaterialApp(home: WalletScreen()));
}

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      'sl': '01',
      'name': 'Santiago Dslab',
      'tripNo': '#G6BF78',
      'date': DateTime(2024, 7, 3),
      'amount': 300.0
    },
    {
      'sl': '02',
      'name': 'John Doe',
      'tripNo': '#H7CF89',
      'date': DateTime(2024, 7, 4),
      'amount': 450.0
    },
    {
      'sl': '03',
      'name': 'Jane Smith',
      'tripNo': '#J8EF90',
      'date': DateTime(2024, 7, 5),
      'amount': 200.0
    },
    {
      'sl': '04',
      'name': 'Alice Brown',
      'tripNo': '#K9GH12',
      'date': DateTime(2024, 7, 6),
      'amount': 600.0
    },
    {
      'sl': '05',
      'name': 'Bob Wilson',
      'tripNo': '#L0IJ34',
      'date': DateTime(2024, 7, 7),
      'amount': 350.0
    },
  ];

  bool isBalanceVisible = true;
  
  final WalletController walletController=Get.put(WalletController());
  @override
  void initState() {
    walletController.getWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(text: AppString.wallet,fontSize: 16,fontWeight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Banner
            Stack(
              children: [
                Container(
                  height: 204,
                  width: screenWidth - 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/walletbanner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx((){
                        return walletController.isWallet.value
                            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent,),)
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         Text(
                              AppString.yourTotalBalance,
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              isBalanceVisible
                                  ? NumberFormat.currency(symbol: '\$').format(walletController.balanceModel.balance)
                                  : "****",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        );
                      }),
                      IconButton(
                        icon: Icon(
                          isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isBalanceVisible = !isBalanceVisible;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          Text(
              AppString.recentTransaction,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            // Transaction Table
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 12.0,
                  headingRowColor:
                  MaterialStateProperty.all(const Color(0xFFBBDEFB)),
                  headingRowHeight: 40,
                  horizontalMargin: 20,
                  columns: const [
                    DataColumn(label: Text('Sl')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Trip No.')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Amount')),
                  ],
                  rows: transactions.map((data) {
                    return DataRow(
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TransactionDetailPage(transaction: data,),
                          ),
                        );
                      },
                      cells: [
                        DataCell(Text(data['sl'])),
                        DataCell(Text(data['name'])),
                        DataCell(Text(data['tripNo'])),
                        DataCell(Text(DateFormat('MMM dd, yyyy')
                            .format(data['date']))),
                        DataCell(Text(NumberFormat.currency(symbol: '\$')
                            .format(data['amount']))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Detail Page (also in same file)

