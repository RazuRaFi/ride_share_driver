import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_share_flat/controller/HomeController/home_controller.dart';
import 'package:ride_share_flat/helpers/app_routes.dart';
import 'package:ride_share_flat/services/socket_services.dart';

import 'helpers/pref_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.getAllPrefData();
  if(PrefsHelper.token.isNotEmpty && PrefsHelper.isOnline){
    HomeController.instance.isOnline.value = PrefsHelper.isOnline;
    SocketServices.connectToSocket(token: PrefsHelper.token);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        transitionDuration: const Duration(milliseconds: 300),
        // home: TestScreen(),
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
