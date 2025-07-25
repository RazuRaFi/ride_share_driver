class CompleteDriverModel {
  final List<CompletedRide> completed;
  final Meta meta;

  CompleteDriverModel({
    required this.completed,
    required this.meta,
  });

  factory CompleteDriverModel.fromJson(Map<String, dynamic> json) {
    return CompleteDriverModel(
      completed: (json['completed'] as List<dynamic>?)
          ?.map((e) => CompletedRide.fromJson(e))
          .toList() ??
          [],
      meta: Meta.fromJson(json['meta'] ?? {}),
    );
  }
}

class CompletedRide {
  final String id;
  final Passenger passenger;
  final Address pickupLocation;
  final Address dropoffLocation;
  final String endTime;
  final PassengerRating passengerRating;
  final double netFare;

  CompletedRide({
    required this.id,
    required this.passenger,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.endTime,
    required this.passengerRating,
    required this.netFare,
  });

  factory CompletedRide.fromJson(Map<String, dynamic> json) {
    return CompletedRide(
      id: json['_id'] ?? '',
      passenger: Passenger.fromJson(json['passengerId'] ?? {}),
      pickupLocation: Address.fromJson(json['pickupLocation'] ?? {}),
      dropoffLocation: Address.fromJson(json['dropofLocation'] ?? {}),
      endTime: json['endTime'] ?? '',
      passengerRating: PassengerRating.fromJson(json['passengerRating'] ?? {}),
      netFare: (json['netFare'] ?? 0).toDouble(),
    );
  }
}

class Passenger {
  final String id;
  final String fullName;
  final String profileImage;

  Passenger({
    required this.id,
    required this.fullName,
    required this.profileImage,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class Address {
  final String address;

  Address({
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['address'] ?? '',
    );
  }
}

class PassengerRating {
  final String id;
  final int rating;

  PassengerRating({
    required this.id,
    required this.rating,
  });

  factory PassengerRating.fromJson(Map<String, dynamic> json) {
    return PassengerRating(
      id: json['_id'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}
