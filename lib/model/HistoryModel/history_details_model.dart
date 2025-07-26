class HistoryDetailsModel {
  final String id;
  final Passenger passenger;
  final Driver driver;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final Location pickupLocation;
  final Location dropofLocation;
  final String startTime;
  final String endTime;
  final String rideTotalTime;
  final double fare;
  final double distance;
  final Rating driverRating;
  final Rating passengerRating;
  final String fullAddress;
  final bool roundTrip;
  final int timeInMilliseconds;
  final double safetyFee;
  final double discount;
  final double netFare;
  final bool isScheduled;
  final String createdAt;
  final String updatedAt;
  final int subTotal;

  HistoryDetailsModel({
    required this.id,
    required this.passenger,
    required this.driver,
    required this.vehicleType,
    required this.status,
    required this.ridePaymentMethod,
    required this.pickupLocation,
    required this.dropofLocation,
    required this.startTime,
    required this.endTime,
    required this.rideTotalTime,
    required this.fare,
    required this.distance,
    required this.driverRating,
    required this.passengerRating,
    required this.fullAddress,
    required this.roundTrip,
    required this.timeInMilliseconds,
    required this.safetyFee,
    required this.discount,
    required this.netFare,
    required this.isScheduled,
    required this.createdAt,
    required this.updatedAt,
    required this.subTotal,
  });

  factory HistoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return HistoryDetailsModel(
      id: json['_id'] ?? '',
      passenger: Passenger.fromJson(json['passengerId'] ?? {}),
      driver: Driver.fromJson(json['driverId'] ?? {}),
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation: Location.fromJson(json['pickupLocation'] ?? {}),
      dropofLocation: Location.fromJson(json['dropofLocation'] ?? {}),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      fare: _toDouble(json['fare']),
      distance: _toDouble(json['distance']),
      driverRating: Rating.fromJson(json['driverRating'] ?? {}),
      passengerRating: Rating.fromJson(json['passengerRating'] ?? {}),
      fullAddress: json['fullAddress'] ?? '',
      roundTrip: json['roundTrip'] ?? false,
      timeInMilliseconds: json['timeInMilliseconds'] ?? 0,
      safetyFee: _toDouble(json['safetyFee']),
      discount: _toDouble(json['discount']),
      netFare: _toDouble(json['netFare']),
      isScheduled: json['isScheduled'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      subTotal: json['subTotal'] ?? 0,
    );
  }

  static double _toDouble(dynamic value) {
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
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

class Driver {
  final String id;
  final String fullName;
  final String profileImage;

  Driver({
    required this.id,
    required this.fullName,
    required this.profileImage,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class Location {
  final String address;
  final GeoPoint location;

  Location({
    required this.address,
    required this.location,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
      location: GeoPoint.fromJson(json['location'] ?? {}),
    );
  }
}

class GeoPoint {
  final String type;
  final List<double> coordinates;

  GeoPoint({
    required this.type,
    required this.coordinates,
  });

  factory GeoPoint.fromJson(Map<String, dynamic> json) {
    List<dynamic> coordsRaw = json['coordinates'] ?? [0.0, 0.0];

    List<double> coords = coordsRaw.map((e) {
      if (e is int) return e.toDouble();
      if (e is double) return e;
      if (e is String) return double.tryParse(e) ?? 0.0;
      return 0.0;
    }).toList();

    return GeoPoint(
      type: json['type'] ?? 'Point',
      coordinates: coords,
    );
  }
}

class Rating {
  final String id;
  final int rating;

  Rating({
    required this.id,
    required this.rating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['_id'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}
