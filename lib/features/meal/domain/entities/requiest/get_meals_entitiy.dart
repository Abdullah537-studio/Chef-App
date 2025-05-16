class GetMealsEntitiy {
  GetMealsEntitiy({
    required this.message,
    required this.meals,
  });

  final String message;
  final List<Meal> meals;

  factory GetMealsEntitiy.fromJson(Map<String, dynamic> json) {
    return GetMealsEntitiy(
      message: json["message"] ?? "",
      meals: json["meals"] == null
          ? []
          : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
    );
  }
}

class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.howToSell,
    required this.images,
    required this.category,
    required this.chefId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String name;
  final String description;
  final int price;
  final String howToSell;
  final List<String> images;
  final String category;
  final ChefId? chefId;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: json["price"] ?? 0,
      howToSell: json["howToSell"] ?? "",
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      category: json["category"] ?? "",
      chefId: json["chefId"] == null ? null : ChefId.fromJson(json["chefId"]),
      status: json["status"] ?? "",
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
    );
  }
}

class ChefId {
  ChefId({
    required this.id,
    required this.name,
    required this.phone,
    required this.brandName,
  });

  final String id;
  final String name;
  final String phone;
  final String brandName;

  factory ChefId.fromJson(Map<String, dynamic> json) {
    return ChefId(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      brandName: json["brandName"] ?? "",
    );
  }
}
