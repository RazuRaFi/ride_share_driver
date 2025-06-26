import 'package:get/get.dart';
import 'package:ride_share_flat/view/screen/common_screen/CreatePassword/create_new_password.dart';
import 'package:ride_share_flat/view/screen/common_screen/EmailVerification/email_verification.dart';
import 'package:ride_share_flat/view/screen/common_screen/ForgottenPassword/forgottern_password.dart';
import 'package:ride_share_flat/view/screen/common_screen/Onboarding/Onboarding_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/SignUp/SIgn_up_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/signIn/sign_in_screen.dart';
import 'package:ride_share_flat/view/screen/common_screen/splash/splash_screen.dart';
import 'package:ride_share_flat/view/test_screen.dart';

import '../view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/DirverArrived/DriverBegun/ConfirmPayment/confirm_payment.dart';
import '../view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/DirverArrived/DriverBegun/driver_begun.dart';
import '../view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/DirverArrived/driver_arrived.dart';
import '../view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/RidersPickup/riders_pickup.dart';
import '../view/screen/driver/HomeScreen/HomeChild/BookingScreen/FindingRides/finding_rides.dart';




class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String passengerOnboarding = "/passenger_onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String navBarScreen = "/common_bottom_bar.dart";
  static const String homeScreen = "/home_screen.dart";
  static const String helpCenterScreen = "/help_center_screen.dart";
  static const String filterScreen = "/filter_screen.dart";
  static const String viewDetailsScreen = "/view_details_screen.dart";
  static const String insightsScreen = "/insights_screen.dart";
  static const String subscriptionScreen = "/subscription_screen.dart";
  static const String feedbackScreen = "/feedback_screen.dart";
  static const String featureRequestScreen = "/feature_request_screen.dart";
  static const String findingRides = "/findingRides_screen.dart";
  static const String riderspickup = "/riderspickup.dart";
  static const String driverArrived = "/driverArrived.dart";
  static const String driverbegun = "/driverbegun.dart";
  static const String confirmPayment = "/confirmPayment.dart";


  static const String roleSelectionScreen = "/role_selection_screen.dart";
  static const String welcomeScreen = "/welcome_screen.dart";
  static const String offersScreen = "/offer_screen.dart";
  static const String tripDetailsScreen = "/trip_details_screen.dart";
  static const String paymentMethodScreen = "/payment_method_screen.dart";
  static const String historyScreen = "/history_screen.dart";
  static const String fAQScreen = "/faq_screen.dart";
  static const String orderTrackingScreen = "/order_tracking_screen.dart";
  static const String pendingTripDetailsScreen = "/pending_trip_details_screen.dart";
  static const String safetyScreen = "/safety_screen.dart";
  static const String customerServiceScreen = "/customer_service_screen.dart";
  static const String setLocationScreen = "/set_location_map_screen.dart";
  static const String scheduledTripScreen = "/scheduled_trip_screen.dart";
  static const String scheduleTripDetailsScreen = "/schedule_trip_detail_screen.dart";
  static const String mapScreen = "/map_screen.dart";
  static const String completeProfileScreen = "/complete_profile_screen.dart";
  static const String identityConfirmationScreen = "/indentity_confirmation.dart";
  static const String withdrawalInformationScreen = "/withdrawal_information.dart";
  static const String earningScreen = "/earning_screen.dart";
  static const String earningDetailsScreen = "/earning_details_screen.dart";
  static const String withdrawScreen = "/withdraw_screen.dart";
  static const String driverHomeScreen = "/driver_home_screen.dart";

  static List<GetPage> routes = [
    GetPage(
        name: test,
        page: () => const TestScreen(),
        transition: Transition.fade),
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        transition: Transition.fade),
    GetPage(
        name: passengerOnboarding,
        page: () => OnboardingScreen(),
        transition: Transition.fade),
    GetPage(
        name: signUp,
        page: () => SignUpScreen(),
        transition: Transition.fade),
    // GetPage(
    //     name: verifyUser,
    //     page: () => const EmailVerification(),
    //     transition: Transition.fade),
    GetPage(
        name: signIn,
        page: () => SignInScreen(),
        transition: Transition.fade),
    GetPage(
        name: forgotPassword,
        page: () => ForgottenPassword(),
        transition: Transition.fade),
    GetPage(
        name: verifyEmail,
        page: () => const EmailVerification(),
        transition: Transition.fade),
    GetPage(
        name: createPassword,
        page: () => CreateNewPassword(),
        transition: Transition.fade),
    GetPage(
        name: findingRides,
        page: () => FindingRides(),
        transition: Transition.fade),
    GetPage(
        name:riderspickup,
        page: () => RidersPickup(),
        transition: Transition.fade),
    GetPage(
        name:driverArrived,
        page: () => DriverArrived(),
        transition: Transition.fade),
    GetPage(
        name:driverbegun,
        page: () => DriverBegun(),
        transition: Transition.fade),
    GetPage(
        name:confirmPayment,
        page: () => ConfirmPayment(),
        transition: Transition.fade),

  ];
}