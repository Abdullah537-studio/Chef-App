import 'dart:io';

class AddMealRequiestModel {
  final String name;
  final String description;
  final int price;
  final String category;
  final File mealImages;
  final String howToSell;

  const AddMealRequiestModel({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.mealImages,
    required this.howToSell,
  });
}
