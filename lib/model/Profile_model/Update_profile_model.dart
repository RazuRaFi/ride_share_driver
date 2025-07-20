class UpdateProfileModel {
  final String id;
  final String fullName;
  final String firstName;
  final String email;
  final String phone;
  final String profileImage;
  final String profile;
  final String role;
  final String address;
  final String gender;
  final String licenseNumber;
  final bool userVerification;
  final bool isProfileComplete;
  final bool verifyIdentity;
  final bool isBlocked;
  final bool isDeleted;
  final bool termsAndConditions;
  final String createdAt;
  final String updatedAt;
  final Dob dob;

  UpdateProfileModel({
    this.id = '',
    this.fullName = '',
    this.firstName = '',
    this.email = '',
    this.phone = '',
    this.profileImage = '',
    this.profile = '',
    this.role = '',
    this.address = '',
    this.gender = '',
    this.licenseNumber = '',
    this.userVerification = false,
    this.isProfileComplete = false,
    this.verifyIdentity = false,
    this.isBlocked = false,
    this.isDeleted = false,
    this.termsAndConditions = false,
    this.createdAt = '',
    this.updatedAt = '',
    required this.dob,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      firstName: json['firstName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profileImage'] ?? '',
      profile: json['profile'] ?? '',
      role: json['role'] ?? '',
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      licenseNumber: json['licenseNumber'] ?? '',
      userVerification: json['userVerification'] ?? false,
      isProfileComplete: json['isProfileComplete'] ?? false,
      verifyIdentity: json['verifyIdentity'] ?? false,
      isBlocked: json['isBlocked'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      termsAndConditions: json['termsAndConditions'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      dob: Dob.fromJson(json['dob'] ?? {}),
    );
  }
}

class Dob {
  final String day;
  final String month;
  final String year;

  Dob({
    this.day = '',
    this.month = '',
    this.year = '',
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      day: json['day'] ?? '',
      month: json['month'] ?? '',
      year: json['year'] ?? '',
    );
  }
}
