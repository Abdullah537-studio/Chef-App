import 'package:chef_app/core/database/remote/api_urls.dart';

class ChangeForgettonPasswrodRequiestModel {
  final String email;
  final String password;
  final String confirmPassword;
  final String code;

  const ChangeForgettonPasswrodRequiestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.code,
  });
  Map<String, dynamic> toJson() {
    return {
      ApiKey.email: email,
      ApiKey.password: email,
      ApiKey.confirmPassword: confirmPassword,
      ApiKey.code: code,
    };
  }
}
