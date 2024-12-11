import 'package:chef_app/core/database/error/error_model.dart';

class ServerException implements Exception {
  final ErrorModel? errorModel;

  const ServerException({this.errorModel});
}

class BadRequestException extends ServerException {
  const BadRequestException({super.errorModel});
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException({super.errorModel});
}

class ForbiddenException extends ServerException {
  const ForbiddenException({super.errorModel});
}

class NotFoundException extends ServerException {
  const NotFoundException({super.errorModel});
}

class ConflictException extends ServerException {
  const ConflictException({super.errorModel});
}

class BadCertificateException extends ServerException {
  const BadCertificateException({super.errorModel});
}

class ConnectionErrorException extends ServerException {
  const ConnectionErrorException({super.errorModel});
}

class ConnectionTimeoutException extends ServerException {
  const ConnectionTimeoutException({super.errorModel});
}

class ReceiveTimeoutException extends ServerException {
  const ReceiveTimeoutException({super.errorModel});
}

class SendTimeoutException extends ServerException {
  const SendTimeoutException({super.errorModel});
}

class CancelException extends ServerException {
  const CancelException({super.errorModel});
}

class UnknownException extends ServerException {
  const UnknownException({super.errorModel});
}
