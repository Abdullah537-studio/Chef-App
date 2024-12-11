import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_interseptors.dart';
import 'package:chef_app/core/database/remote/api_url.dart';
import 'package:chef_app/strings/exception_string.dart';
import 'package:dio/dio.dart';

// class DioConsumer extends ApiConsumer {
//   final Dio dio;

//   DioConsumer(this.dio) {
//     dio.options.baseUrl = ApiUrl.baseUrl;
//     dio.interceptors.add(ApiInterseptors());
//     dio.interceptors.add(LogInterceptor());
//   }

//   @override
//   Future get(String path,
//       {Object? data, Map<String, dynamic>? queryParameters}) async {
//     return await _request(
//         () => dio.get(path, data: data, queryParameters: queryParameters));
//   }

//   @override
//   Future post(String path,
//       {Object? data, Map<String, dynamic>? queryParameters}) async {
//     return await _request(
//         () => dio.post(path, data: data, queryParameters: queryParameters));
//   }

//   @override
//   Future delete(String path,
//       {Object? data, Map<String, dynamic>? queryParameters}) async {
//     return await _request(
//         () => dio.delete(path, queryParameters: queryParameters));
//   }

//   @override
//   Future patche(String path,
//       {Object? data, Map<String, dynamic>? queryParameters}) async {
//     return await _request(
//         () => dio.patch(path, data: data, queryParameters: queryParameters));
//   }

//   Future<dynamic> _request(Future<Response> Function() request) async {
//     try {
//       final response = await request();
//       return response;
//     } on DioException catch (e) {
//       return _handleDioException(e);
//     }
//   }

//   ErrorModel _handleDioException(DioException e) {
//     String message =
//         e.response?.data['message'] ?? ExceptionString.unknownErrorString;
//     int status = e.response?.statusCode ?? 500;

//     if (e.response != null) {
//       return ErrorModel(
//         errorMessage: message,
//         status: status,
//       );
//     } else {
//       throw mapDioExceptionToServerException(e);
//     }
//   }

//   ServerException mapDioExceptionToServerException(DioException e) {
//     switch (e.type) {
//       case DioExceptionType.badCertificate:
//         ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
//         return ServerException(errorModel: errorModel);
//       case DioExceptionType.connectionError:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.connectionErrorString,
//           status: 500,
//         ));
//       case DioExceptionType.connectionTimeout:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.connectionTimeoutString,
//           status: 408,
//         ));
//       case DioExceptionType.receiveTimeout:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.receiveTimeoutString,
//           status: 500,
//         ));
//       case DioExceptionType.sendTimeout:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.sendTimeoutString,
//           status: 500,
//         ));
//       case DioExceptionType.cancel:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.requestCancelledString,
//           status: 499,
//         ));
//       case DioExceptionType.unknown:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.unknownErrorString,
//           status: 500,
//         ));
//       case DioExceptionType.badResponse:
//         return _handleBadResponse(e.response!);
//       default:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.unknownErrorString,
//           status: 500,
//         ));
//     }
//   }

//   ServerException _handleBadResponse(Response response) {
//     String errorMessage = response.data['ErrorMessage'] ??
//         ExceptionString.unexpectedResponseString;

//     switch (response.statusCode) {
//       case 400:
//         return ServerException(
//             errorModel: ErrorModel(
//           errorMessage: errorMessage,
//           status: 400,
//         ));
//       case 401:
//         return ServerException(
//             errorModel: const ErrorModel(
//           errorMessage: ExceptionString.unauthorizedString,
//           status: 401,
//         ));
//       // أضف بقية الحالات حسب الحاجة
//       default:
//         return ServerException(
//             errorModel: ErrorModel(
//           errorMessage: errorMessage,
//           status: response.statusCode ?? 500,
//         ));
//     }
//   }
// }
class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = ApiUrl.baseUrl;
    dio.interceptors.add(ApiInterseptors());
    dio.interceptors.add(LogInterceptor());
  }

  Future<dynamic> _request(Future<Response> Function() request) async {
    try {
      final response = await request();
      return response;
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  ErrorModel _handleDioException(DioException e) {
    if (e.response != null) {
      return _handleBadResponse(e.response!);
    } else {
      return const ErrorModel(
        errorMessage: ExceptionString.unknownErrorString,
        status: 500,
      );
    }
  }

  ErrorModel _handleBadResponse(Response response) {
    ErrorModel errorModel = ErrorModel.fromJson(response.data);
    String errorMessage = errorModel.errorMessage;

    switch (response.statusCode) {
      case 400:
        return ErrorModel(
          errorMessage: errorMessage,
          status: 400,
        );
      case 401:
        return const ErrorModel(
          errorMessage: ExceptionString.unauthorizedString,
          status: 401,
        );
      // أضف بقية الحالات حسب الحاجة
      default:
        return ErrorModel(
          errorMessage: errorMessage,
          status: response.statusCode ?? 500,
        );
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    return await _request(
        () => dio.get(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _request(
        () => dio.post(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    return await _request(
        () => dio.delete(path, queryParameters: queryParameters));
  }

  @override
  Future patche(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    return await _request(
        () => dio.patch(path, data: data, queryParameters: queryParameters));
  }
}
