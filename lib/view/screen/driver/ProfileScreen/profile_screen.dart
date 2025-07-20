import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_share_flat/controller/Profile/profile_controller.dart';
import 'package:ride_share_flat/helpers/my_extension.dart';
import 'package:ride_share_flat/services/api_services.dart';
import 'package:ride_share_flat/utils/app_urls.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/screen/common_screen/FAQ/faq_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/SafetyScreen/safety_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/Terms&Services/terms_services.dart';
import 'package:ride_share_flat/view/screen/common_screen/signIn/sign_in_screen.dart';


import '../../../../utils/app_colors.dart';
import '../../../component/image/common_image.dart';
import '../HistoryScreen/history_screen.dart';
import '../WalletScreen/offer_screen.dart';
import 'EditProfileScreen/edit_profile.dart';
import 'OrderTracking/order_tracking.dart';
import 'SettingsPage/settings_page.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller=Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getMyProfile();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CommonText(
          text: "Profile",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx((){
                    return controller.isGetProfile.value
                        ? Center(child: CircularProgressIndicator(),)
                        : Row(
                      spacing: 10,
                      children: [
                        Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child:ClipOval(
                            child: CommonImage(
                              imageSrc:
                              "${AppUrls.imageUrl}${controller.profileDetailsModel.user.profileImage}",
                              imageType: ImageType.network,
                              fill: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: controller.profileDetailsModel.user.fullName,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            CommonText(
                              text:controller.profileDetailsModel.user.phone,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      Get.to(EditProfileScreen());
                    },
                    child: SizedBox(
                      height: 43,
                      width: 90,
                      child: Column(
                        spacing: 5,
                        children: [
                          Image.asset(
                            "assets/icons/editprofile.png",
                            height: 20,
                            width: 20,
                          ),
                          CommonText(text: "Edit Profile"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.brown),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabItem(
                    image: "assets/icons/walleticon.png",
                    label: "Wallet",
                    onTap:(){
                      Get.to(()=>WalletScreen());
                    }),
                _buildTabItem(
                  image: "assets/icons/history.png",
                  label: "History",
                  onTap: () {
                    Get.to(HistoryScreen());
                  },
                ),
                _buildTabItem(
                  image: "assets/icons/faq.png",
                  label: "FAQ",
                  onTap: () {
                  Get.to(()=>FAQScreen());
                  },
                ),

              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 10,
                children: [
                  roleContainer(title: "Schedule your ride.",
                      details:"Schedule your next trip up to 60 days ago.",
                      image: "assets/images/calender.png")
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(OrderTracking());
                        },
                      child: ListItem(title: 'Order Tracking', icon: 'assets/icons/order.png',)),
                  GestureDetector(
                    onTap: (){
                      Get.to(SettingsPage());
                    },

                      child: ListItem(title: 'Settings', icon: 'assets/icons/settings.png',)),
                  GestureDetector(
                    onTap: (){
                      Get.to(SafetyScreen());
                    },
                      child: ListItem(title: 'Safety', icon: 'assets/icons/safety.png',)),
                  GestureDetector(
                    onTap: (){
                      Get.to(TermsServices());
                    },
                      child: ListItem(title: 'Terms of Services', icon: 'assets/icons/terms.png',)),
                  GestureDetector(
                    onTap: (){
                      Get.to(FAQScreen());
                    },
                      child: ListItem(title: 'FAQ', icon: 'assets/icons/faq2.png',)),
                ],
              ),
            ),
            SizedBox(height: 24),

            GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        height: 140,
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonText(
                              text: "Do you want to logout your profile?",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CommonButton(
                                  titleText: 'Yes',
                                  backgroundColor: Colors.black,
                                  buttonHeight: 45,
                                  buttonWidth: 120,
                                  titleSize: 14,
                                  onTap: () {
                                    // Add logout logic here
                                    Get.offAll(()=>SignInScreen());
                                  },
                                ),
                                CommonButton(
                                  titleText: 'No',
                                  backgroundColor: Colors.white,
                                  buttonHeight: 45,
                                  buttonWidth: 120,
                                  borderColor: Colors.black,
                                  titleColor: Colors.black,
                                  titleSize: 14,
                                  onTap: () {
                                   Get.back();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30),
                  child: Row(
                    spacing: 10,
                    children: [
                      Image.asset("assets/icons/logout.png",height: 24,width: 24,),
                      CommonText(text:"Log Out",fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff990000),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),






          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key, required this.title, required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 64,
      width: 361,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        spacing: 10,
        children: [
          Image.asset(icon,height: 24,width: 24,),
          CommonText(text:title,fontSize: 14,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}



class roleContainer extends StatelessWidget {
  const roleContainer({
    super.key, required this.title, required this.details, required this.image,
  });
  final String title;
  final String details;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 361,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  CommonText(text:title,fontSize: 14,fontWeight: FontWeight.w500,),
                  CommonText(textAlign: TextAlign.start,
                      text: details,maxLines: 2,fontSize: 12,fontWeight: FontWeight.w400,),
                ],
              ),
            ),
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}

Widget _buildTabItem({
  required String image,
  required String label,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: 100,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 25, width: 25),
          const SizedBox(height: 8),
          CommonText(text: label, fontSize: 16, fontWeight: FontWeight.w500),
        ],
      ),
    ),
  );
}
