import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:dio/dio.dart';

class EditProfileRequest {
  final String? name;
  final String? phone;
  final Location? location;
  final String? brandName;
  final int? minCharge;
  final String? disc;
  final String? profilePic;

  const EditProfileRequest({
    required this.name,
    required this.phone,
    this.location,
    required this.brandName,
    required this.minCharge,
    required this.disc,
    required this.profilePic,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "location": location!.toJson(),
      // Location(
      //   name: "methalfa",
      //   address: "meet halfa",
      //   coordinates: [1214451511, 12541845],
      // ),
      "brandName": brandName,
      "minCharge": minCharge,
      "disc": disc,
    };
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      ...toJson(),
      "profilePic": await MultipartFile.fromFile(profilePic!),
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
