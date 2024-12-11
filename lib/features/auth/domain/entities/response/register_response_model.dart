class RegisterResponseModel {
  final String message;

  const RegisterResponseModel({required this.message});
  factory RegisterResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterResponseModel(message: jsonData["message"]);
  }
}
