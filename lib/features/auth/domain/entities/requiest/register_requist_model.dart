import 'package:dio/dio.dart';

class RegisterRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final Location location;
  final String brandName;
  final int minCharge;
  final String disc;
  String healthCertificate;
  String frontId;
  String backId;
  String profilePic;

  RegisterRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.location,
    required this.brandName,
    required this.minCharge,
    required this.disc,
    required this.healthCertificate,
    required this.frontId,
    required this.backId,
    required this.profilePic,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "location": location,
      "brandName": brandName,
      "minCharge": minCharge,
      "disc": disc,
    };
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'location[name]': location.name,
      'location[address]': location.address,
      'location[coordinates]': location.coordinates,
      'brandName': brandName,
      'minCharge': minCharge,
      'disc': disc,
      'healthCertificate': await MultipartFile.fromFile(healthCertificate),
      'frontId': await MultipartFile.fromFile(frontId),
      'backId': await MultipartFile.fromFile(backId),
      'profilePic': await MultipartFile.fromFile(profilePic),
    });
    // return FormData.fromMap({
    //   ...toJson(),
    //   "healthCertificate": await MultipartFile.fromFile(
    //       healthCertificate?.path ?? "",
    //       filename: healthCertificate?.path.split('/').last),
    //   "frontId": await MultipartFile.fromFile(frontId?.path ?? "",
    //       filename: frontId?.path.split('/').last),
    //   "backId": await MultipartFile.fromFile(backId?.path ?? "",
    //       filename: backId?.path.split('/').last),
    //   "profilePic": await MultipartFile.fromFile(profilePic?.path ?? "",
    //       filename: profilePic?.path.split('/').last),
    // });
  }
}

class Location {
  String name;
  String address;
  List<int> coordinates;

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
