

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/DrawerController/drawer_controller.dart';
import 'package:ride_share_flat/controller/HomeController/home_controller.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import 'package:ride_share_flat/view/component/text_field/custom_textfield.dart';

import '../../../../helpers/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../component/CommonText.dart';
import '../../../component/image/common_image.dart';
import '../../../component/text_field/search_textfiled.dart';
import '../../Map/map_screen.dart';
import 'HomeChild/BookingScreen/booking_screen.dart';
import 'HomeChild/Notifications/notifications.dart';
import 'HomeChild/RentCar/rent_car.dart';
import 'HomeChild/Schedule/Schedule_screen.dart';
import 'HomeChild/SetLocation/set_location.dart';
import 'Widget/drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController=Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: HomeDrawer(),
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: CommonImage(
                      imageSrc: AppIcons.drawermenu,
                      imageType: ImageType.png,
                      size: 24,
                    ),
                  ),
                  IconButton(onPressed: (){
                    Get.to(Notifications());
                  }, icon: Icon(Icons.notifications_none_outlined,size: 24,))
                ],
              ),
              MapScreen()
            ],
          ),
        ),
      ),
    );
  }
}
