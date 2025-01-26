class EditProfileResponse {
  final String message;

  const EditProfileResponse({required this.message});
  factory EditProfileResponse.fromJson(Map<String, dynamic> jsonData) {
    return EditProfileResponse(message: jsonData["message"]);
  }
}
