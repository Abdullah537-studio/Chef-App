import 'package:chef_app/core/model/location.dart';
import 'package:dio/dio.dart';

class EditProfileRequest {
  String? name;
  String? phone;
  Location? location;
  String? brandName;
  int? minCharge;
  String? disc;
  String? profilePic;

  EditProfileRequest({
    this.name,
    this.phone,
    this.location,
    this.brandName,
    this.minCharge,
    this.disc,
    this.profilePic,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "name": name,
      "phone": phone,
      "location": location!.toJson(),
      "brandName": brandName,
      "minCharge": minCharge,
      "disc": disc,
      // "profilePic":
      //     profilePic != null ? await MultipartFile.fromFile(profilePic!) : null,
    });
  }
}

// class Location {
//   String name;
//   String address;
//   List<double> coordinates;

//   Location({
//     required this.name,
//     required this.address,
//     required this.coordinates,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'address': address,
//       'coordinates': coordinates,
//     };
//   }
// }
