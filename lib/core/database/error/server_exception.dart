import 'package:chef_app/core/database/error/error_model.dart';

class ServerException implements Exception {
  final ErrorModel? errorModel;

  ServerException({this.errorModel});
}
