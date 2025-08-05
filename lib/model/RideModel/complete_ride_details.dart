class CompleteRideModel {
  final String id;
  final Passenger passenger;
  final Driver driver;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final RideLocation pickupLocation;
  final RideLocation dropoffLocation;
  final String startTime;
  final String endTime;
  final String rideTotalTime;
  final double payment;
  final double fare;
  final double distance;
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

  CompleteRideModel({
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
    required this.payment,
    required this.fare,
    required this.distance,
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

  factory CompleteRideModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return CompleteRideModel(
      id: json['_id'] ?? '',
      passenger: Passenger.fromJson(json['passengerId'] ?? {}),
      driver: Driver.fromJson(json['driverId'] ?? {}),
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation: RideLocation.fromJson(json['pickupLocation'] ?? {}),
      dropoffLocation: RideLocation.fromJson(json['dropofLocation'] ?? {}),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      payment: parseDouble(json['payment']),
      fare: parseDouble(json['fare']),
      distance: parseDouble(json['distance']),
      driverRating: parseDouble(json['driverRating']),
      passengerRating: parseDouble(json['passengerRating']),
      pickupDate: json['pickupDate'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
      fullAddress: json['fullAddress'] ?? '',
      roundTrip: json['roundTrip'] ?? false,
      timeInMilliseconds: json['timeInMilliseconds'] ?? 0,
      safetyFee: parseDouble(json['safetyFee']),
      discount: parseDouble(json['discount']),
      netFare: parseDouble(json['netFare']),
      subTotal: parseDouble(json['subTotal']),
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

class RideLocation {
  final String address;
  final Location location;

  RideLocation({
    required this.address,
    required this.location,
  });

  factory RideLocation.fromJson(Map<String, dynamic> json) {
    return RideLocation(
      address: json['address'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
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
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List?)?.map((e) {
        if (e is int) return e.toDouble();
        if (e is double) return e;
        if (e is String) return double.tryParse(e) ?? 0.0;
        return 0.0;
      }).toList() ??
          [0.0, 0.0],
    );
  }
}
