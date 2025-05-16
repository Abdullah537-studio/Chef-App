import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/get_meals_entitiy.dart';
import 'package:chef_app/features/meal/domain/repositories/meals_repository.dart';
import 'package:dartz/dartz.dart';

class GetMealsDataUsecase {
  final MealsRepository repository;

  const GetMealsDataUsecase({required this.repository});
  Future<Either<ErrorModel, GetMealsEntitiy>> call() async {
    return await repository.getMealsData();
  }
}
