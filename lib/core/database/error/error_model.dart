class ErrorModel {
  final String errorMessage;
  final int? status;

  const ErrorModel({required this.errorMessage, this.status});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData["ErrorMessage"],
      status: jsonData["status"],
    );
  }
}
