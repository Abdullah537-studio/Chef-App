import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:chef_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecasess {
  final AuthRepository repository;

  const RegisterUsecasess({required this.repository});
  Future<Either<ServerException, RegisterResponseModel>> call({
    required RegisterRequiestModel registerRequiestModel,
  }) async {
    return await repository.signup(
      registerRequiestModel: registerRequiestModel,
    );
  }
}
