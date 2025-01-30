import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/profile/domain/entities/request/change_password_request.dart';
import 'package:chef_app/features/profile/domain/entities/response/change_password_response.dart';
import 'package:chef_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordProfileUsecase {
  final ProfileRepository repository;
  const ChangePasswordProfileUsecase({required this.repository});
  Future<Either<ErrorModel, ChangePasswordResponse>> call(
      {required ChangePasswordRequest changePasswordRequest}) async {
    return repository.changePassword(
        changePassowrdRequest: changePasswordRequest);
  }
}
