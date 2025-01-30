class ChangePasswordResponse {
  final String message;

  const ChangePasswordResponse({required this.message});
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> jsonData) {
    return ChangePasswordResponse(message: jsonData["message"]);
  }
}
