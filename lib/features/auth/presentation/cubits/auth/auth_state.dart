part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({required this.cubitStatus, required this.message});
  final CubitStatus cubitStatus;
  final String message;

  factory AuthState.initial() {
    return const AuthState(cubitStatus: CubitStatus.initial, message: "");
  }

  @override
  bool get stringify => true;
  @override
  List<Object> get props => [message, cubitStatus];

  AuthState copyWith({CubitStatus? cubitStatus, String? message}) {
    return AuthState(
      cubitStatus: cubitStatus ?? this.cubitStatus,
      message: message ?? this.message,
    );
  }
}
