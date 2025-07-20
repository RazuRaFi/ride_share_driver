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
  final String firstName;
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
  final bool isBlocked;
  final bool isDeleted;
  final bool termsAndConditions;
  final String createdAt;
  final String updatedAt;

  User({
    this.id = '',
    this.fullName = '',
    this.firstName = '',
    this.email = '',
    this.phone = '',
    this.profileImage = '',
    required this.profile,
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      firstName: json['firstName'] ?? '',
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
      isBlocked: json['isBlocked'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      termsAndConditions: json['termsAndConditions'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class Profile {
  final String id;
  final String user;
  final Address homeAddress;
  final Address workAddress;
  final Address currentAddress;
  final String createdAt;
  final String updatedAt;

  Profile({
    this.id = '',
    this.user = '',
    required this.homeAddress,
    required this.workAddress,
    required this.currentAddress,
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
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
    this.address = '',
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
    this.type = 'Point',
    this.coordinates = const [0.0, 0.0],
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final rawCoords = json['coordinates'];
    List<double> coords = [0.0, 0.0];

    if (rawCoords is List) {
      coords = rawCoords.map((e) {
        if (e is int) return e.toDouble();
        if (e is double) return e;
        if (e is String) return double.tryParse(e) ?? 0.0;
        return 0.0;
      }).toList();
    }

    return Location(
      type: json['type'] ?? 'Point',
      coordinates: coords.length == 2 ? coords : [0.0, 0.0],
    );
  }
}

class Rating {
  final int totalRatings;
  final double averageRating;

  Rating({
    this.totalRatings = 0,
    this.averageRating = 0.0,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      totalRatings: json['totalRatings'] is int ? json['totalRatings'] : 0,
      averageRating: _toDouble(json['averageRating']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
