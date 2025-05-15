import 'dart:convert';
import 'dart:io';

import 'package:chef_app/core/model/location.dart';
import 'package:dio/dio.dart';

class EditProfileRequest {
  String? name;
  String? phone;
  LocationModel? location;
  String? brandName;
  int? minCharge;
  String? disc;

  // الصورة القديمة من الـ API كـ URL.
  String? profilePicUrl;
  // الصورة الجديدة (إذا قام المستخدم بتغييرها).
  File? profilePicFile;

  EditProfileRequest(
      {this.name,
      this.phone,
      this.location,
      this.brandName,
      this.minCharge,
      this.disc,
      this.profilePicFile,
      this.profilePicUrl});

  Future<FormData> toFormData() async {
    final Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "location": jsonEncode(location?.toJson()),
      "brandName": brandName,
      "minCharge": minCharge,
      "disc": disc,
    };
    // إذا كانت الصورة الجديدة موجودة، قم بضمها في الطلب.
    if (profilePicFile != null) {
      data["profilePic"] = await MultipartFile.fromFile(
        profilePicFile!.path,
        filename: profilePicFile!.path.split('/').last,
      );
    }
    return FormData.fromMap(data);
  }
}
