import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/send_code_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemote {
  Future<LoginResponseModel> login(
      {required LoginRequiestModel loginRequiestModel});
  Future<RegisterResponseModel> signup(
      {required RegisterRequestModel registerRequestModel});
  Future<SendCodeResponseModel> sendCode(
      {required SendCodeRequistModel sendCodeRequistModel});
}

class AuthRemoteImpl implements AuthRemote {
  @override
  Future<LoginResponseModel> login(
      {required LoginRequiestModel loginRequiestModel}) async {
    Response response = await sl<ApiConsumer>()
        .post(ApiPost.chefSignIn, data: loginRequiestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 202) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<RegisterResponseModel> signup(
      {required RegisterRequestModel registerRequestModel}) async {
    FormData formData = await registerRequestModel.toFormData();
    Response response =
        await sl<ApiConsumer>().post(ApiPost.chefSignUp, data: formData);

    if (response.statusCode == 200 || response.statusCode == 202) {
      return RegisterResponseModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<SendCodeResponseModel> sendCode(
      {required SendCodeRequistModel sendCodeRequistModel}) async {
    Response response = await sl<ApiConsumer>()
        .post(ApiPost.chefSendCode, data: sendCodeRequistModel.toJson());
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return SendCodeResponseModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
