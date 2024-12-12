import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/features/auth/data/datasources/auth_remote.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/send_code_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:chef_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chef_app/network/network_info.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemote authRemote;
  const AuthRepositoryImpl(
      {required this.networkInfo, required this.authRemote});
//!-------------------------------- login --------------------------------------
  @override
  Future<Either<ErrorModel, LoginResponseModel>> login(
      {required LoginRequiestModel loginRequiestModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final loginData =
            await authRemote.login(loginRequiestModel: loginRequiestModel);
        return Right(loginData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return const Left(ErrorModel(errorMessage: "offline"));
    }
  }

//!---------------------------------register------------------------------------
  @override
  Future<Either<ErrorModel, RegisterResponseModel>> signup(
      {required RegisterRequiestModel registerRequiestModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final registerData = await authRemote.signup(
            registerRequiestModel: registerRequiestModel);
        return Right(registerData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return const Left(ErrorModel(errorMessage: "errorModel"));
    }
  }

  @override
  Future<Either<ErrorModel, SendCodeResponseModel>> sendCode(
      {required SendCodeRequistModel sendCodeRequistModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final forgetPasswordData = await authRemote.sendCode(
            sendCodeRequistModel: sendCodeRequistModel);
        return Right(forgetPasswordData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return const Left(ErrorModel(errorMessage: "offline"));
    }
  }
}
