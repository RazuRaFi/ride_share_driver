

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../view/screen/driver/HistoryScreen/history_screen.dart';
import '../../view/screen/driver/HomeScreen/home_screen.dart';
import '../../view/screen/driver/OfferScreen/offer_screen.dart';
import '../../view/screen/driver/ProfileScreen/profile_screen.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    WalletScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
}