import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());
}
