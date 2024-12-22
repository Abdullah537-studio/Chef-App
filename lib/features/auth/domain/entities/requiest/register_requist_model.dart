import 'dart:io';

class RegisterRequiestModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? location;
  String? brandName;
  String? minCharge;
  String? disc;
  File? healthCertificate;
  File? frontId;
  File? backId;
  File? profilePic;

  RegisterRequiestModel({
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
      "frontId": frontId,
      "backId": backId,
      "profilePic": profilePic
    };
  }
}
