
import 'package:get/get.dart';

class HomeController extends GetxController{

  int selectedIndex = 0;

  void select(int index) {
    selectedIndex = index;
  }



  List serviceList=[
    {'image':"assets/images/service1.png", "title":"Moto Bike"},
    {'image':"assets/images/service2.png", "title":"Car"},
    {'image':"assets/images/service3.png", "title":"Rent Car"},
    {'image':"assets/images/service4.png", "title":"Schedule"},
  ];
  List scopeList=[
    {'image':"assets/icons/scope1.png", "title":"Passenger’s safety","details":"On-trip help with safety issues"},
    {'image':"assets/icons/scope1.png", "title":"First-class rides","details":"Top-rated drivers, newer cars"},
  ];
}