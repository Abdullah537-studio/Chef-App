import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/profile/domain/entities/chef_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<ErrorModel, ChefDataEntity>> getChefData();
}
