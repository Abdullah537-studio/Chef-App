import 'package:chef_app/core/model/location.dart';
import 'package:dio/dio.dart';

class EditMealRequest {
  final String name;
  final String phone;
  final LocationModel location;
  final String brandName;
  final int minCharge;
  final String disc;
  final String profilePic;

  const EditMealRequest({
    required this.name,
    required this.phone,
    required this.location,
    required this.brandName,
    required this.minCharge,
    required this.disc,
    required this.profilePic,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "location": location.toJson(),
      "brandName": brandName,
      "minCharge": minCharge,
      "disc": disc,
    };
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      ...toJson(),
      "profilePic": await MultipartFile.fromFile(profilePic),
    });
  }
}
