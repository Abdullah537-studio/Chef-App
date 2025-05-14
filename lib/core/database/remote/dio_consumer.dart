import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_interseptors.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = ApiBaseUrl.baseUrl;
    dio.interceptors.add(ApiInterseptors());
    dio.interceptors.add(LogInterceptor());
  }
//!----------------------- methods
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    return await _request(
        () => dio.get(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
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

//!------------------ handel request for all methods
  Future<dynamic> _request(Future<Response> Function() request) async {
    try {
      final response = await request();
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        _handleDioException(e);
      } else {
        debugPrint(e.toString());
      }
    }
  }

//!------------------ handel error for all methods
  ServerException _handleDioException(DioException e) {
    if (e.response != null) {
      switch (e.type) {
        case DioExceptionType.badCertificate:
          throw BadCertificateException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.connectionError:
          throw ConnectionErrorException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.connectionTimeout:
          throw ConnectionTimeoutException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.receiveTimeout:
          throw ReceiveTimeoutException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.sendTimeout:
          throw SendTimeoutException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.cancel:
          throw CancelException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.unknown:
          throw UnknownException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.badResponse:
          throw _handleBadResponse(e.response!);
        // default:
        //   throw ServerException(
        //     errorModel: ErrorModel.fromJson(e.response!.data),
        //   );
      }
    } else {
      return ServerException(
          errorModel: ErrorModel(errorMessage: e.toString()));
    }
  }

  ServerException _handleBadResponse(Response response) {
    switch (response.statusCode) {
      case 400: // bad request
        throw BadRequestException(
          errorModel: ErrorModel.fromJson(response.data),
        );
      case 401: // unauthorized
        throw UnauthorizedException(
          errorModel: ErrorModel.fromJson(response.data),
        );
      case 403: // forbidden
        throw ForbiddenException(
          errorModel: ErrorModel.fromJson(response.data),
        );
      case 404: // not found
        throw NotFoundException(
          errorModel: ErrorModel.fromJson(response.data),
        );
      case 409: // conflict
        throw ConflictException(
          errorModel: ErrorModel.fromJson(response.data),
        );
      default:
        dynamic errorData = response.data;
        if (errorData is String) {
          errorData = ErrorModel.normalizeErrorData(errorData);
        }
        throw ServerException(
          errorModel: ErrorModel.fromJson(errorData as Map<String, dynamic>),
        );
    }
  }
}
