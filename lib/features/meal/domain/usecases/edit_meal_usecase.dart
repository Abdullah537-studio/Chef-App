import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/edit_meal_request.dart';
import 'package:chef_app/features/meal/domain/entities/response/edit_meal_response.dart';
import 'package:chef_app/features/meal/domain/repositories/meal_repository.dart';
import 'package:dartz/dartz.dart';

class EditMealUsecase {
  final MealRepository repository;

  const EditMealUsecase({required this.repository});
  Future<Either<ErrorModel, EditMealResponse>> call(
      {required EditMealRequest editMealRequest}) async {
    return repository.edit(editMealRequest: editMealRequest);
  }
}
