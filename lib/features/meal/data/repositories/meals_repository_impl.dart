import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/network/network_info.dart';
import 'package:chef_app/features/meal/data/datasources/meals_data_remote.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/get_meals_entitiy.dart';
import 'package:chef_app/features/meal/domain/repositories/meals_repository.dart';
import 'package:dartz/dartz.dart';

class MealsRepositoryImpl implements MealsRepository {
  final NetworkInfo networkInfo;
  final MealsDataRemote remoteData;

  const MealsRepositoryImpl(
      {required this.networkInfo, required this.remoteData});

  @override
  Future<Either<ErrorModel, GetMealsEntitiy>> getMealsData() async {
    if (await networkInfo.isConnected) {
      try {
        final getData = await remoteData.getMealsData();
        return Right(getData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return Left(ErrorModel(errorMessage: "offline"));
    }
  }
}
