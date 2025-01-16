class ErrorModel {
  final String errorMessage;
  final int? status;
  final List? error;
  const ErrorModel({required this.errorMessage, this.status, this.error});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData["ErrorMessage"],
      status: jsonData["status"],
      error: jsonData["Error"],
    );
  }
}
