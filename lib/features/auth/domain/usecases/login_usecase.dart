import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepository repository;
  const LoginUsecase({required this.repository});
  Future<Either<ErrorModel, LoginResponseModel>> call({
    required LoginRequiestModel loginRequiestModel,
  }) async {
    return await repository.login(
      loginRequiestModel: loginRequiestModel,
    );
  }
}
