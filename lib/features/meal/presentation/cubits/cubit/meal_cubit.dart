import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/features/meal/domain/entities/requiest/get_meals_entitiy.dart';
import 'package:chef_app/features/meal/domain/usecases/get_meals_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final GetMealsDataUsecase getMealsDataUsecase;
  MealCubit(this.getMealsDataUsecase) : super(MealState.initial());
  Future<void> getMealsData() async {
    if (isClosed) return;
    emit(state.copyWith(status: CubitStatus.loading));
    final getMealsData = await getMealsDataUsecase();
    getMealsData.fold(
      (failure) {
        debugPrint("Failure Error: ${failure.error}");

        emit(state.copyWith(
            status: CubitStatus.error, message: failure.errorMessage));
      },
      (response) {
        emit(state.copyWith(status: CubitStatus.loaded, response: response));
      },
    );
  }
}
