import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/features/auth/data/datasources/auth_remote.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:chef_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chef_app/network/network_info.dart';
import 'package:chef_app/strings/exception_string.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemote authRemote;
  const AuthRepositoryImpl(
      {required this.networkInfo, required this.authRemote});
//!-------------------------------- login --------------------------------------
  @override
  Future<Either<ServerException, LoginResponseModel>> login(
      {required LoginRequiestModel loginRequiestModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final loginData =
            await authRemote.login(loginRequiestModel: loginRequiestModel);
        return Right(loginData);
      } on DioException catch (e) {
        return Left(
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ),
        );
      }
    } else {
      ErrorModel errorModel = const ErrorModel(
        errorMessage: ExceptionString.offlineExceptionString,
      );
      return Left(ServerException(errorModel: errorModel));
    }
  }

//!---------------------------------register------------------------------------
  @override
  Future<Either<ServerException, RegisterResponseModel>> signup(
      {required RegisterRequiestModel registerRequiestModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final registerData = await authRemote.signup(
            registerRequiestModel: registerRequiestModel);
        return Right(registerData);
      } on ServerException catch (e) {
        return Left(e);
      }
    } else {
      ErrorModel errorModel = const ErrorModel(
          errorMessage: ExceptionString.offlineExceptionString, status: 0);
      return Left(ServerException(errorModel: errorModel));
    }
  }
}
