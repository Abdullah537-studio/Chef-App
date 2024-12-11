class ForgetPasswordResponseModel {
  final String message;

  const ForgetPasswordResponseModel({required this.message});

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return ForgetPasswordResponseModel(
      message: jsonData["message"],
    );
  }
}
