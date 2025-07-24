class RideResponseModel {
  final List<Ride> ride;
  final Meta meta;

  RideResponseModel({
    this.ride = const [],
    this.meta = const Meta(),
  });

  factory RideResponseModel.fromJson(Map<String, dynamic> json) {
    return RideResponseModel(
      ride: (json['ride'] as List? ?? []).map((e) => Ride.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta'] ?? {}),
    );
  }
}

class Ride {
  final String id;
  final Passenger passenger;
  final Location pickupLocation;
  final Location dropoffLocation;
  final String pickupDate;
  final String pickupTime;

  Ride({
    this.id = '',
    this.passenger = const Passenger(),
    this.pickupLocation = const Location(),
    this.dropoffLocation = const Location(),
    this.pickupDate = '',
    this.pickupTime = '',
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['_id'] ?? '',
      passenger: Passenger.fromJson(json['passengerId'] ?? {}),
      pickupLocation: Location.fromJson(json['pickupLocation'] ?? {}),
      dropoffLocation: Location.fromJson(json['dropofLocation'] ?? {}),
      pickupDate: json['pickupDate'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
    );
  }
}

class Passenger {
  final String id;
  final String fullName;
  final String profileImage;

  const Passenger({
    this.id = '',
    this.fullName = '',
    this.profileImage = '',
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class Location {
  final String address;

  const Location({this.address = ''});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  const Meta({
    this.page = 1,
    this.limit = 10,
    this.total = 0,
    this.totalPage = 1,
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
