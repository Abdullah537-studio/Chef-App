import 'dart:io';

import 'package:dio/dio.dart';

class RegisterRequestModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  Map<String, dynamic>? location;
  String? brandName;
  int? minCharge;
  String? disc;
  File? healthCertificate;
  File? frontId;
  File? backId;
  File? profilePic;

  RegisterRequestModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
    this.location,
    this.brandName,
    this.minCharge,
    this.disc,
    this.healthCertificate,
    this.frontId,
    this.backId,
    this.profilePic,
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
      ...toJson(),
      "healthCertificate": await MultipartFile.fromFile(
          healthCertificate?.path ?? "",
          filename: healthCertificate?.path.split('/').last),
      "frontId": await MultipartFile.fromFile(frontId?.path ?? "",
          filename: frontId?.path.split('/').last),
      "backId": await MultipartFile.fromFile(backId?.path ?? "",
          filename: backId?.path.split('/').last),
      "profilePic": await MultipartFile.fromFile(profilePic?.path ?? "",
          filename: profilePic?.path.split('/').last),
    });
  }
}
