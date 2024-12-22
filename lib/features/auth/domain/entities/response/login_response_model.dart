import 'package:chef_app/core/database/remote/api_url.dart';

class LoginResponseModel {
  final String? message;
  final String? token;

  const LoginResponseModel({this.message, this.token});
  factory LoginResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginResponseModel(
      message: jsonData[ApiKey.message],
      token: jsonData[ApiKey.token],
    );
  }
}
