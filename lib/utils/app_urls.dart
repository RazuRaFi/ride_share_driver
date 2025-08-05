class AppUrls {
  static const baseUrl = "http://10.10.10.31:7010/api/v1";
  static const imageUrl = "http://10.10.10.31:7010";
  static const socketUrl = "http://103.145.138.74:3001";



  static const signUp = "$baseUrl/users/create-driver";
  static const verifyEmail = "$baseUrl/users/create-user-verify-otp";
  static const signIn = "$baseUrl/auth/login";
  static const forgotPassword = "$baseUrl/auth/forgot-password-otpByEmail";
  static const verifyOtp = "$baseUrl/auth/forgot-password-otp-match";
  static const resetPassword = "$baseUrl/auth/forgot-password-reset";
  static const changePassword = "$baseUrl/auth/change-password";
  static const user = "$baseUrl/users";
  static const privacyPolicies = "$baseUrl/privacy-policies";
  static const termsOfServices = "$baseUrl/terms-and-conditions";
  static const chats = "$baseUrl/chats";
  static const messages = "$baseUrl/messages";
  static const myProfile = "$baseUrl/driver/get-profile";
  static const updateProfile = "$baseUrl/users/update-my-profile";
  static const safety = "$baseUrl/safety";
  static const faq = "$baseUrl/settings/all-faq";
  static const policy = "$baseUrl/policy";
  static const wallet = "$baseUrl/wallet/get-balance";
  static const offer = "$baseUrl/offer";
  static const notification = "$baseUrl/notifications/my-notifications";
  static const customerService = "$baseUrl/customer";
  static const delete = "$baseUrl/users/delete-my-account";
  static const completeProfile = "$baseUrl/users/complete";
  static const pendingRider = "$baseUrl/driver/get-pending-rides";
  static const completeRider = "$baseUrl/driver/get-complete-rides";
  static String riderDetails(String id) => "$baseUrl/driver/get-pending-rides/$id";
  static String completeDetails(String id) => "$baseUrl/driver/get-complete-rides/$id";
  static const history = "$baseUrl/driver/history";
  static String historyDetails(String id) => "$baseUrl/driver/history/$id";
  static const balance = "$baseUrl/wallet/get-balance";

}