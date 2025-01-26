import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/edit_meal_request.dart';
import 'package:chef_app/features/meal/domain/entities/response/edit_meal_response.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepository {
  Future<Either<ErrorModel, EditMealResponse>> edit(
      {required EditMealRequest editMealRequest});
}
