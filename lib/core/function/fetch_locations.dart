import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/database/remote/api_consumer.dart';
import 'package:chef_app/core/database/remote/api_urls.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:chef_app/core/model/location.dart';

Future<List<LocationModel>> fetchLocations(String query) async {
  Response response = await sl<ApiConsumer>().get(
    ApiGet.locationNominatimOpenstreetmap(query),
  );

  if (response.statusCode == 200) {
    try {
      final List<dynamic> data = response.data;
      return data.map((item) => LocationModel.fromNominatimJson(item)).toList();
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  } else {
    throw ServerException(errorModel: ErrorModel.fromJson(response.data));
  }
}
