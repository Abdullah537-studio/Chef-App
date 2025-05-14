class Location {
  String name;
  String address;
  List<double> coordinates;

  Location({
    required this.name,
    required this.address,
    required this.coordinates,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'coordinates': coordinates,
    };
  }
}

class LocationModel {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  LocationModel({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "coordinates": [latitude, longitude],
    };
  }

  factory LocationModel.fromNominatimJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['display_name'] ?? "Unknown",
      address: json['display_name'] ?? "Unknown",
      latitude: double.tryParse(json['lat'] ?? "") ?? 0.0,
      longitude: double.tryParse(json['lon'] ?? "") ?? 0.0,
    );
  }
}
