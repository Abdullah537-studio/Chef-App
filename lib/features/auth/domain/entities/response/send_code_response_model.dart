import 'package:chef_app/core/database/remote/api_url.dart';

class SendCodeResponseModel {
  final String message;

  const SendCodeResponseModel({required this.message});

  factory SendCodeResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return SendCodeResponseModel(
      message: jsonData[ApiKey.message],
    );
  }
}
