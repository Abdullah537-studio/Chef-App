class ChefDataEntity {
  ChefDataEntity({
    required this.chef,
  });

  final Chef? chef;

  factory ChefDataEntity.fromJson(Map<String, dynamic> json) {
    return ChefDataEntity(
      chef: json["chef"] == null ? null : Chef.fromJson(json["chef"]),
    );
  }
}

class Chef {
  Chef({
    this.password,
    this.confirmPassword,
    this.location,
    this.id,
    this.name,
    this.phone,
    this.email,
    this.brandName,
    this.profilePic,
    this.minCharge,
    this.disc,
    this.frontId,
    this.backId,
    this.menu,
    this.online,
    this.healthCertificate,
    this.stock,
    this.status,
    this.createdAt,
  });

  final Location? location;
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? brandName;
  final String? profilePic;
  final int? minCharge;
  final String? disc;
  final String? frontId;
  final String? backId;
  final List<dynamic>? menu;
  final bool? online;
  final String? healthCertificate;
  final int? stock;
  final String? status;
  final DateTime? createdAt;
  final String? password;
  final String? confirmPassword;

  factory Chef.fromJson(Map<String, dynamic> json) {
    return Chef(
      password: json["password"],
      confirmPassword: json["confirmPassword"],
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      id: json["_id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      brandName: json["brandName"],
      profilePic: json["profilePic"],
      minCharge: json["minCharge"],
      disc: json["disc"],
      frontId: json["frontId"],
      backId: json["backId"],
      menu: json["menu"] == null
          ? []
          : List<dynamic>.from(json["menu"]!.map((x) => x)),
      online: json["online"],
      healthCertificate: json["healthCertificate"],
      stock: json["stock"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  final String? type;
  final List<int> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"],
      coordinates: json["coordinates"] == null
          ? []
          : List<int>.from(json["coordinates"]!.map((x) => x)),
    );
  }
}
