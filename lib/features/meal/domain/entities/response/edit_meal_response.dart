class EditMealResponse {
  final String message;

  const EditMealResponse({required this.message});
  factory EditMealResponse.fromJson(Map<String, dynamic> jsonData) {
    return EditMealResponse(message: jsonData["message"]);
  }
}
