part of 'meal_cubit.dart';

class MealState extends Equatable {
  const MealState({required this.status, this.message, this.response});
  final CubitStatus status;
  final String? message;
  final EditMealResponse? response;
  factory MealState.initial() {
    return const MealState(status: CubitStatus.initial);
  }
  MealState copyWith({
    CubitStatus? status,
    String? message,
    EditMealResponse? response,
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
