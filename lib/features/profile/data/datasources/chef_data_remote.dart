import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_url.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/profile/domain/entities/chef_data_entity.dart';

abstract class ChefDataRemote {
  Future<ChefDataEntity> getChefData();
}

class ChefDataRemoteImpl extends ChefDataRemote {
  @override
  Future<ChefDataEntity> getChefData() async {
    CacheHelper get = CacheHelper();
    String id = await get.getData(key: ApiKey.id) ?? "";

    try {
      var response =
          await sl<ApiConsumer>().get(ApiGet.getChefDataEndPoint(id));

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 202)) {
        return ChefDataEntity.fromJson(response.data);
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } catch (e) {
      throw ServerException(errorModel: ErrorModel(errorMessage: e.toString()));
    }
  }
}
