import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/get_meals_entitiy.dart';
import 'package:dartz/dartz.dart';

abstract class MealsRepository {
  Future<Either<ErrorModel, GetMealsEntitiy>> getMealsData();
}
