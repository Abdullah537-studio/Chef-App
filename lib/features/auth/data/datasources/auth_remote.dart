import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_url.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/register_response_model.dart';
import 'package:chef_app/strings/exception_string.dart';

abstract class AuthRemote {
  Future<LoginResponseModel> login(
      {required LoginRequiestModel loginRequiestModel});
  Future<RegisterResponseModel> signup(
      {required RegisterRequiestModel registerRequiestModel});
}

class AuthRemoteImpl implements AuthRemote {
  @override
  Future<LoginResponseModel> login(
      {required LoginRequiestModel loginRequiestModel}) async {
    var response = await sl<ApiConsumer>()
        .post(ApiPost.chefSignIn, data: loginRequiestModel.toJson());
// no statusCode
    if (response.statusCode == 200 || response.statusCode == 202) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw const ErrorModel(errorMessage: ExceptionString.unknownErrorString);
    }
  }

  @override
  Future<RegisterResponseModel> signup(
      {required RegisterRequiestModel registerRequiestModel}) async {
    var response = await sl<ApiConsumer>()
        .post(ApiPost.chefSignUp, data: registerRequiestModel.toJson());

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return RegisterResponseModel.fromJson(response.data);
    } else {
      throw const ErrorModel(errorMessage: ExceptionString.unknownErrorString);
    }
  }
}
