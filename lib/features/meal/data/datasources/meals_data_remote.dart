import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/get_meals_entitiy.dart';
import 'package:dio/dio.dart';

abstract class MealsDataRemote {
  Future<GetMealsEntitiy> getMealsData();
}

class MealsDataRemoteImpl implements MealsDataRemote {
  @override
  Future<GetMealsEntitiy> getMealsData() async {
    Response response = await sl<ApiConsumer>().get(ApiGet.getAllMealsData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return GetMealsEntitiy.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
