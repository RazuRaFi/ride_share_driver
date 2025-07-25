class DriverDetailsModel {
  final String id;
  final Passenger passenger;
  final Driver driver;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final LocationDetails pickupLocation;
  final LocationDetails dropoffLocation;
  final String startTime;
  final String endTime;
  final String rideTotalTime;
  final double fare;
  final double distance;
  final double payment;
  final double driverRating;
  final double passengerRating;
  final String pickupDate;
  final String pickupTime;
  final String fullAddress;
  final bool roundTrip;
  final int timeInMilliseconds;
  final double safetyFee;
  final double discount;
  final double netFare;
  final double subTotal;
  final bool isScheduled;
  final String createdAt;
  final String updatedAt;

  DriverDetailsModel({
    required this.id,
    required this.passenger,
    required this.driver,
    required this.vehicleType,
    required this.status,
    required this.ridePaymentMethod,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.startTime,
    required this.endTime,
    required this.rideTotalTime,
    required this.fare,
    required this.distance,
    required this.payment,
    required this.driverRating,
    required this.passengerRating,
    required this.pickupDate,
    required this.pickupTime,
    required this.fullAddress,
    required this.roundTrip,
    required this.timeInMilliseconds,
    required this.safetyFee,
    required this.discount,
    required this.netFare,
    required this.subTotal,
    required this.isScheduled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DriverDetailsModel.fromJson(Map<String, dynamic> json) {
    return DriverDetailsModel(
      id: json['_id'] ?? '',
      passenger: Passenger.fromJson(json['passengerId'] ?? {}),
      driver: Driver.fromJson(json['driverId'] ?? {}),
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation: LocationDetails.fromJson(json['pickupLocation'] ?? {}),
      dropoffLocation: LocationDetails.fromJson(json['dropofLocation'] ?? {}),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      fare: (json['fare'] ?? 0).toDouble(),
      distance: (json['distance'] ?? 0).toDouble(),
      payment: (json['payment'] ?? 0).toDouble(),
      driverRating: (json['driverRating'] ?? 0).toDouble(),
      passengerRating: (json['passengerRating'] ?? 0).toDouble(),
      pickupDate: json['pickupDate'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
      fullAddress: json['fullAddress'] ?? '',
      roundTrip: json['roundTrip'] ?? false,
      timeInMilliseconds: json['timeInMilliseconds'] ?? 0,
      safetyFee: (json['safetyFee'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      netFare: (json['netFare'] ?? 0).toDouble(),
      subTotal: (json['subTotal'] ?? 0).toDouble(),
      isScheduled: json['isScheduled'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
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

class LocationDetails {
  final String address;
  final Coordinates location;

  LocationDetails({
    required this.address,
    required this.location,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return LocationDetails(
      address: json['address'] ?? '',
      location: Coordinates.fromJson(json['location'] ?? {}),
    );
  }
}

class Coordinates {
  final String type;
  final List<double> coordinates;

  Coordinates({
    required this.type,
    required this.coordinates,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
          [0.0, 0.0],
    );
  }
}
