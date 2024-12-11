import 'dart:io';

class RegisterRequiestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String location;
  final String brandName;
  final String minCharge;
  final String disc;
  final File healthCertificate;
  final File frontId;
  final File backId;
  final File profilePic;

  const RegisterRequiestModel({
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
      "healthCertificate": healthCertificate,
      "frontId": frontId,
      "backId": backId,
      "profilePic": profilePic
    };
  }
}
