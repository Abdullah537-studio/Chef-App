part of 'meal_cubit.dart';

class MealState extends Equatable {
  const MealState({
    required this.status,
    required this.message,
    required this.response,
  });
  final CubitStatus status;
  final String? message;
  final GetMealsEntitiy? response;

  factory MealState.initial() {
    return const MealState(
        status: CubitStatus.initial, message: "", response: null);
  }
  MealState copyWith({
    CubitStatus? status,
    String? message,
    GetMealsEntitiy? response,
  }) {
    return MealState(
      status: status ?? this.status,
      message: message ?? this.message,
      response: response ?? this.response,
    );
  }

  @override
  List<Object> get props => [status, message ?? "", response ?? ""];
}
