import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/profile/domain/entities/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetChefDataUsecase {
  final ProfileRepository repository;

  const GetChefDataUsecase({required this.repository});

  Future<Either<ErrorModel, ChefDataEntity>> call() async {
    return await repository.getChefData();
  }
}
