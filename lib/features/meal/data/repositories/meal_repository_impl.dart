import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/network/network_info.dart';
import 'package:chef_app/features/meal/data/datasources/meal_remote.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/edit_meal_request.dart';
import 'package:chef_app/features/meal/domain/entities/response/edit_meal_response.dart';
import 'package:chef_app/features/meal/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

class MealRepositoryImpl implements MealRepository {
  final NetworkInfo networkInfo;

  final MealRemote remote;

  const MealRepositoryImpl({required this.networkInfo, required this.remote});

  @override
  Future<Either<ErrorModel, EditMealResponse>> edit(
      {required EditMealRequest editMealRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final mealData = await remote.edit(editMealRequest: editMealRequest);
        return Right(mealData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return const Left(ErrorModel(errorMessage: "offline"));
    }
  }
}
