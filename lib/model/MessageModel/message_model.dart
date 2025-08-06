class CompleteRideModel {
  final String id;
  final Passenger passenger;
  final String driverId;
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
  final String driverRating;
  final String passengerRating;
  final String fullAddress;
  final bool roundTrip;
  final int timeInMilliseconds;
  final double safetyFee;
  final double discount;
  final double subTotal;
  final double netFare;
  final List<MessageModel> messages;
  final bool isScheduled;
  final String createdAt;
  final String updatedAt;
  final int v;

  const CompleteRideModel({
    this.id = '',
    this.passenger = const Passenger(),
    this.driverId = '',
    this.vehicleType = '',
    this.status = '',
    this.ridePaymentMethod = '',
    this.pickupLocation = const RideLocation(),
    this.dropoffLocation = const RideLocation(),
    this.startTime = '',
    this.endTime = '',
    this.rideTotalTime = '',
    this.payment = 0.0,
    this.fare = 0.0,
    this.distance = 0.0,
    this.driverRating = '',
    this.passengerRating = '',
    this.fullAddress = '',
    this.roundTrip = false,
    this.timeInMilliseconds = 0,
    this.safetyFee = 0.0,
    this.discount = 0.0,
    this.subTotal = 0.0,
    this.netFare = 0.0,
    this.messages = const [],
    this.isScheduled = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  factory CompleteRideModel.fromJson(Map<String, dynamic> json) {
    return CompleteRideModel(
      id: json["_id"] ?? '',
      passenger: Passenger.fromJson(json["passengerId"] ?? {}),
      driverId: json["driverId"] ?? '',
      vehicleType: json["vehicle_type"] ?? '',
      status: json["status"] ?? '',
      ridePaymentMethod: json["ride_payment_method"] ?? '',
      pickupLocation: RideLocation.fromJson(json["pickupLocation"] ?? {}),
      dropoffLocation: RideLocation.fromJson(json["dropofLocation"] ?? {}),
      startTime: json["startTime"] ?? '',
      endTime: json["endTime"] ?? '',
      rideTotalTime: json["rideTotalTime"] ?? '',
      payment: (json["payment"] ?? 0).toDouble(),
      fare: (json["fare"] ?? 0).toDouble(),
      distance: (json["distance"] ?? 0).toDouble(),
      driverRating: json["driverRating"] ?? '',
      passengerRating: json["passengerRating"] ?? '',
      fullAddress: json["fullAddress"] ?? '',
      roundTrip: json["roundTrip"] ?? false,
      timeInMilliseconds: json["timeInMilliseconds"] ?? 0,
      safetyFee: (json["safetyFee"] ?? 0).toDouble(),
      discount: (json["discount"] ?? 0).toDouble(),
      subTotal: (json["subTotal"] ?? 0).toDouble(),
      netFare: (json["netFare"] ?? 0).toDouble(),
      messages: (json["messages"] as List<dynamic>? ?? [])
          .map((e) => MessageModel.fromJson(e))
          .toList(),
      isScheduled: json["isScheduled"] ?? false,
      createdAt: json["createdAt"] ?? '',
      updatedAt: json["updatedAt"] ?? '',
      v: json["__v"] ?? 0,
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
      id: json["_id"] ?? '',
      fullName: json["fullName"] ?? '',
      profileImage: json["profileImage"] ?? '',
    );
  }
}

class RideLocation {
  final LocationPoint location;
  final String address;

  const RideLocation({
    this.location = const LocationPoint(),
    this.address = '',
  });

  factory RideLocation.fromJson(Map<String, dynamic> json) {
    return RideLocation(
      location: LocationPoint.fromJson(json["location"] ?? {}),
      address: json["address"] ?? '',
    );
  }
}

class LocationPoint {
  final String type;
  final List<double> coordinates;

  const LocationPoint({
    this.type = '',
    this.coordinates = const [],
  });

  factory LocationPoint.fromJson(Map<String, dynamic> json) {
    return LocationPoint(
      type: json["type"] ?? '',
      coordinates: (json["coordinates"] as List<dynamic>? ?? [])
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}

class MessageModel {
  final String sender;
  final String text;
  final String createdAt;
  final List<dynamic> seenBy;

  const MessageModel({
    this.sender = '',
    this.text = '',
    this.createdAt = '',
    this.seenBy = const [],
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json["sender"] ?? '',
      text: json["text"] ?? '',
      createdAt: json["createdAt"] ?? '',
      seenBy: json["seenBy"] is List ? json["seenBy"] ?? [] : [],
    );
  }
}
