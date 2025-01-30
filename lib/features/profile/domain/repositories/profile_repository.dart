import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/profile/domain/entities/request/change_password_request.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/domain/entities/response/change_password_response.dart';
import 'package:chef_app/features/profile/domain/entities/response/edit_profile_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<ErrorModel, ChefDataEntity>> getChefData();
  Future<Either<ErrorModel, EditProfileResponse>> edit(
      {required EditProfileRequest editProfileRequest});
  Future<Either<ErrorModel, ChangePasswordResponse>> changePassword(
      {required ChangePasswordRequest changePassowrdRequest});
}
