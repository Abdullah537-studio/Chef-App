import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/strings/key_cache_value.dart';
import 'package:dio/dio.dart';

//  Interceptor from dio
class ApiInterseptors extends Interceptor {
  CacheHelper storage = CacheHelper();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await storage.getData(key: AppKeyCache.token);

    if (token != null) {
      options.headers["token"] = "FOODAPI $token";
    } else {
      options.headers["Authorization"] = "Bearer ";
    }
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }
}
