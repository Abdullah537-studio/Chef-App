import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  //? login
  Future<Either<ErrorModel, LoginResponseModel>> login(
      {required LoginRequiestModel loginRequiestModel});
  //? register
  Future<Either<ErrorModel, RegisterResponseModel>> signup({
    required RegisterRequiestModel registerRequiestModel,
  });
}
