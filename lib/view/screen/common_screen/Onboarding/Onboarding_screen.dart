import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/splash_controller/Onboarding_controller.dart';
import '../together_screen/together_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController pageController = PageController();
  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Let’s travel together",
      "subtitle": "Make new friends",
      "image": "assets/images/splash.png",
    },
    {
      "title": "Find a ride",
      "subtitle": "Request a ride and be picked up on the same route by the driver",
      "image": "assets/images/onboard2.png",
    },
    {
      "title": "Post a ride",
      "subtitle": "Publish a ride and pick up passengers along the way",
      "image": "assets/images/onboard3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: controller.updatePage,
              itemCount: onboardingData.length,
              itemBuilder: (_, index) {
                final data = onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(data["image"]!, height: 210, width: 210),
                    SizedBox(height: 20),
                    Text(data["title"]!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(data["subtitle"]!, textAlign: TextAlign.center),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Obx(() {
            final isLastPage = controller.currentPage.value == onboardingData.length - 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => TogetherScreen()); // Direct navigation on skip
                    },
                    child: Text("Skip", style: TextStyle(color: Colors.black)),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () {
                        if (isLastPage) {
                          Get.to(() => TogetherScreen());
                        } else {
                          pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
                        }
                      },
                      icon: Icon(Icons.arrow_forward_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}