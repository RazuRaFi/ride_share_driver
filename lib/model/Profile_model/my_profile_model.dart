class ProfileDetailsModel {
  final User user;
  final Rating rating;

  ProfileDetailsModel({
    required this.user,
    required this.rating,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProfileDetailsModel(
      user: User.fromJson(json['user'] ?? {}),
      rating: Rating.fromJson(json['rating'] ?? {}),
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String profileImage;
  final Profile profile;
  final String role;
  final String address;
  final String gender;
  final String licenseNumber;
  final bool userVerification;
  final bool isProfileComplete;
  final bool verifyIdentity;
  final String createdByRole;
  final bool isBlocked;
  final bool isDeleted;
  final bool termsAndConditions;
  final String createdAt;
  final String updatedAt;
  final Dob dob;
  final bool isVerified;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.profile,
    required this.role,
    required this.address,
    required this.gender,
    required this.licenseNumber,
    required this.userVerification,
    required this.isProfileComplete,
    required this.verifyIdentity,
    required this.createdByRole,
    required this.isBlocked,
    required this.isDeleted,
    required this.termsAndConditions,
    required this.createdAt,
    required this.updatedAt,
    required this.dob,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profileImage'] ?? '',
      profile: Profile.fromJson(json['profile'] ?? {}),
      role: json['role'] ?? '',
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      licenseNumber: json['licenseNumber'] ?? '',
      userVerification: json['userVerification'] ?? false,
      isProfileComplete: json['isProfileComplete'] ?? false,
      verifyIdentity: json['verifyIdentity'] ?? false,
      createdByRole: json['createdByRole'] ?? '',
      isBlocked: json['isBlocked'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      termsAndConditions: json['termsAndConditions'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      dob: Dob.fromJson(json['dob'] ?? {}),
      isVerified: json['isVerified'] ?? false,
    );
  }
}

class Profile {
  final String id;
  final String userId;
  final Address homeAddress;
  final Address workAddress;
  final Address currentAddress;
  final String createdAt;
  final String updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.homeAddress,
    required this.workAddress,
    required this.currentAddress,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['_id'] ?? '',
      userId: json['user'] ?? '',
      homeAddress: Address.fromJson(json['homeAddress'] ?? {}),
      workAddress: Address.fromJson(json['workAddress'] ?? {}),
      currentAddress: Address.fromJson(json['currentAddress'] ?? {}),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class Address {
  final Location location;
  final String address;

  Address({
    required this.location,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      location: Location.fromJson(json['location'] ?? {}),
      address: json['address'] ?? '',
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? 'Point',
      coordinates: (json['coordinates'] as List?)?.map((e) => (e as num).toDouble()).toList() ?? [0.0, 0.0],
    );
  }
}

class Dob {
  final String day;
  final String month;
  final String year;

  Dob({
    required this.day,
    required this.month,
    required this.year,
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      day: json['day'] ?? '',
      month: json['month'] ?? '',
      year: json['year'] ?? '',
    );
  }
}

class Rating {
  final int totalRatings;
  final int averageRating;

  Rating({
    required this.totalRatings,
    required this.averageRating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      totalRatings: json['totalRatings'] ?? 0,
      averageRating: json['averageRating'] ?? 0,
    );
  }
}
