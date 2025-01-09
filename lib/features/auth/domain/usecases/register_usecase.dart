import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:chef_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase {
  final AuthRepository repository;

  const RegisterUsecase({required this.repository});
  Future<Either<ErrorModel, RegisterResponseModel>> call({
    required RegisterRequestModel registerRequestModel,
  }) async {
    return await repository.signup(
      registerRequestModel: registerRequestModel,
    );
  }
}
