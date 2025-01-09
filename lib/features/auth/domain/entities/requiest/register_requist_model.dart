import 'package:dio/dio.dart';

class RegisterRequestModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? location;
  String? brandName;
  String? minCharge;
  String? disc;
  String? healthCertificate;
  String? frontId;
  String? backId;
  String? profilePic;

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
      "healthCertificate": healthCertificate,
    };
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      ...toJson(),
      "frontId": await MultipartFile.fromFile(frontId ?? "",
          filename: 'frontId_${DateTime.now().millisecondsSinceEpoch}.jpg'),
      "backId": await MultipartFile.fromFile(backId ?? "",
          filename: 'backId_${DateTime.now().millisecondsSinceEpoch}.jpg'),
      "profilePic": await MultipartFile.fromFile(profilePic ?? "",
          filename: 'profilePic_${DateTime.now().millisecondsSinceEpoch}.jpg'),
    });
  }
}
