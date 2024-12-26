import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/core/database/error/server_exception.dart';
import 'package:chef_app/core/network/network_info.dart';
import 'package:chef_app/features/profile/data/datasources/chef_data_remote.dart';
import 'package:chef_app/features/profile/domain/entities/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ChefDataRemote remoteData;

  const ProfileRepositoryImpl(
      {required this.networkInfo, required this.remoteData});
  @override
  Future<Either<ErrorModel, ChefDataEntity>> getChefData() async {
    if (await networkInfo.isConnected) {
      try {
        final getData = await remoteData.getChefData();

        return Right(getData);
      } on ServerException catch (e) {
        return Left(e.errorModel!);
      }
    } else {
      return const Left(ErrorModel(errorMessage: "offline"));
    }
  }
}
