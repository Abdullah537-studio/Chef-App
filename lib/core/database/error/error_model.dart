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
  //  في حال كانت نوعية البيانات غير متوقعة أحياناً برجع String بدال map

  static Map<String, dynamic> normalizeErrorData(
    dynamic jsonData, {
    String messageKey = "ErrorMessage",
  }) {
    if (jsonData is String) {
      return {messageKey: jsonData};
    } else if (jsonData is Map<String, dynamic>) {
      return jsonData;
    } else {
      return {messageKey: jsonData.toString()};
    }
  }
}
