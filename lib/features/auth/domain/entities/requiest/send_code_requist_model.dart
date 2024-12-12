import 'package:chef_app/core/database/remote/api_url.dart';

class SendCodeRequistModel {
  final String email;

  const SendCodeRequistModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      ApiKey.email: email,
    };
  }
}
