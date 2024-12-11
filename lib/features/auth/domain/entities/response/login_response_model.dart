class LoginResponseModel {
  final String message;
  final String token;

  const LoginResponseModel({required this.message, required this.token});
  factory LoginResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginResponseModel(
      message: jsonData["message"],
      token: jsonData["token"],
    );
  }
}
