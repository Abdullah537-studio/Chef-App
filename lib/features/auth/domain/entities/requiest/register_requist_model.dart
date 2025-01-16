import 'dart:convert';

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

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'location': jsonEncode(location.toJson()),
      'brandName': brandName,
      'minCharge': minCharge,
      'disc': disc,
      'healthCertificate': await MultipartFile.fromFile(healthCertificate),
      'frontId': await MultipartFile.fromFile(frontId),
      'backId': await MultipartFile.fromFile(backId),
      'profilePic': await MultipartFile.fromFile(profilePic),
    });
  }
}

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

  factory Location.fromString(String locationString) {
    final parts = locationString.split(',');
    final name = parts[0].split(':')[1].trim();
    final address = parts[1].split(':')[1].trim();
    final coordinatesString = parts[2].split(':')[1].trim();
    final coordinatesParts = coordinatesString
        .split(',')
        .map((part) => double.parse(part.trim()))
        .toList();

    return Location(
      name: name,
      address: address,
      coordinates: coordinatesParts,
    );
  }
}
