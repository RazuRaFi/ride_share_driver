class RiderDetailsModel {
  final String id;
  final Passenger passenger;
  final Driver driver;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final Location pickupLocation;
  final Location dropoffLocation;
  final String startTime;
  final String endTime;
  final String rideTotalTime;
  final String payment;
  final int fare;
  final double distance;
  final String driverRating;
  final String passengerRating;
  final String pickupDate;
  final String pickupTime;
  final String fullAddress;
  final bool roundTrip;
  final bool isScheduled;
  final String createdAt;
  final String updatedAt;
  final int v;

  RiderDetailsModel({
    this.id = '',
    this.passenger = const Passenger(),
    this.driver = const Driver(),
    this.vehicleType = '',
    this.status = '',
    this.ridePaymentMethod = '',
    this.pickupLocation = const Location(),
    this.dropoffLocation = const Location(),
    this.startTime = '',
    this.endTime = '',
    this.rideTotalTime = '',
    this.payment = '',
    this.fare = 0,
    this.distance = 0.0,
    this.driverRating = '',
    this.passengerRating = '',
    this.pickupDate = '',
    this.pickupTime = '',
    this.fullAddress = '',
    this.roundTrip = false,
    this.isScheduled = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  factory RiderDetailsModel.fromJson(Map<String, dynamic> json) {
    return RiderDetailsModel(
      id: json['_id'] ?? '',
      passenger: Passenger.fromJson(json['passengerId'] ?? {}),
      driver: Driver.fromJson(json['driverId'] ?? {}),
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation: Location.fromJson(json['pickupLocation'] ?? {}),
      dropoffLocation: Location.fromJson(json['dropofLocation'] ?? {}),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      payment: json['payment'] ?? '',
      fare: json['fare'] ?? 0,
      distance: (json['distance'] ?? 0).toDouble(),
      driverRating: json['driverRating'] ?? '',
      passengerRating: json['passengerRating'] ?? '',
      pickupDate: json['pickupDate'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
      fullAddress: json['fullAddress'] ?? '',
      roundTrip: json['roundTrip'] ?? false,
      isScheduled: json['isScheduled'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
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

class Driver {
  final String id;
  final String fullName;
  final String profileImage;

  const Driver({
    this.id = '',
    this.fullName = '',
    this.profileImage = '',
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
  final Coordinate location;

  const Location({
    this.address = '',
    this.location = const Coordinate(),
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
      location: Coordinate.fromJson(json['location'] ?? {}),
    );
  }
}

class Coordinate {
  final String type;
  final List<double> coordinates;

  const Coordinate({
    this.type = '',
    this.coordinates = const [0.0, 0.0],
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List?)?.map((e) => (e as num).toDouble()).toList() ?? [0.0, 0.0],
    );
  }
}
