import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/edit_meal_request.dart';
import 'package:chef_app/features/meal/domain/entities/response/edit_meal_response.dart';
import 'package:dio/dio.dart';

abstract class MealRemote {
  Future<EditMealResponse> edit({required EditMealRequest editMealRequest});
}

class MealRemoteImpl implements MealRemote {
  @override
  Future<EditMealResponse> edit(
      {required EditMealRequest editMealRequest}) async {
    Response response = await sl<ApiConsumer>().post(
      ApiPost.chefUpdateProfile,
      data: editMealRequest.toFormData(),
    );
    if (response.statusCode == 200 || response.statusCode == 202) {
      return EditMealResponse.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
