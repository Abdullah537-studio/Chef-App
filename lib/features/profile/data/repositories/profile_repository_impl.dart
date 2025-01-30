import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/network/network_info.dart';
import 'package:chef_app/features/profile/data/datasources/chef_data_remote.dart';
import 'package:chef_app/features/profile/domain/entities/request/change_password_request.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/domain/entities/response/change_password_response.dart';
import 'package:chef_app/features/profile/domain/entities/response/edit_profile_response.dart';
import 'package:chef_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ChefDataRemote remoteData;

  const ProfileRepositoryImpl(
      {required this.networkInfo, required this.remoteData});
  @override
  Future<Either<ErrorModel, ChefDataEntity>> getChefData() async {
    if (await networkInfo.isConnected) {
      try {
        final getData = await remoteData.getChefData();

        return Right(getData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return const Left(ErrorModel(errorMessage: "offline"));
    }
  }

  @override
  Future<Either<ErrorModel, EditProfileResponse>> edit(
      {required EditProfileRequest editProfileRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final editChefData = await remoteData.editProfileData(
            editProfileRequest: editProfileRequest);
        return Right(editChefData);
      } on ServerException catch (e) {
        throw Left(e.errorModel);
      }
    } else {
      throw const Left(ErrorModel(errorMessage: "offline"));
    }
  }

  @override
  Future<Either<ErrorModel, ChangePasswordResponse>> changePassword(
      {required ChangePasswordRequest changePassowrdRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final changePasswordData = await remoteData.changePasswordData(
            changePasswordRequest: changePassowrdRequest);
        return Right(changePasswordData);
      } on ServerException catch (e) {
        throw Left(e.errorModel);
      }
    } else {
      throw const Left(ErrorModel(errorMessage: "offline"));
    }
  }
}
