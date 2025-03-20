import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/profile/domain/entities/request/change_password_request.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/domain/entities/response/change_password_response.dart';
import 'package:chef_app/features/profile/domain/entities/response/edit_profile_response.dart';
import 'package:dio/dio.dart';

abstract class ChefDataRemote {
  Future<ChefDataEntity> getChefData();
  Future<EditProfileResponse> editProfileData(
      {required EditProfileRequest editProfileRequest});
  Future<ChangePasswordResponse> changePasswordData(
      {required ChangePasswordRequest changePasswordRequest});
}

class ChefDataRemoteImpl implements ChefDataRemote {
  //! ----------------------------------- getData-----------------------------
  @override
  Future<ChefDataEntity> getChefData() async {
    CacheHelper get = CacheHelper();
    String id = await get.getData(key: ApiKey.id) ?? "";
    Response response =
        await sl<ApiConsumer>().get(ApiGet.getChefDataEndPoint(id));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return ChefDataEntity.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
  //! ----------------------------------- change passwrod-----------------------

  @override
  Future<ChangePasswordResponse> changePasswordData(
      {required ChangePasswordRequest changePasswordRequest}) async {
    Response response = await sl<ApiConsumer>().patche(
        ApiPost.chefChangePassword,
        data: changePasswordRequest.toJson());

    if (response.statusCode == 200 || response.statusCode == 202) {
      return ChangePasswordResponse.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
  //! ----------------------------------- edit profile -------------------------

  @override
  Future<EditProfileResponse> editProfileData(
      {required EditProfileRequest editProfileRequest}) async {
    FormData formData = await editProfileRequest.toFormData();
    Response response = await sl<ApiConsumer>().patche(
      ApiPost.chefUpdateProfile,
      data: formData,
    );
    if (response.statusCode == 200 || response.statusCode == 202) {
      return EditProfileResponse.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
