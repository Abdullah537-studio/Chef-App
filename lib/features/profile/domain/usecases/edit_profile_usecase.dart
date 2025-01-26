import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/domain/entities/response/edit_profile_response.dart';
import 'package:chef_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class EditProfileUsecase {
  final ProfileRepository repository;

  const EditProfileUsecase({required this.repository});

  Future<Either<ErrorModel, EditProfileResponse>> call(
      {required EditProfileRequest editProfileRequest}) {
    return repository.edit(editProfileRequest: editProfileRequest);
  }
}
