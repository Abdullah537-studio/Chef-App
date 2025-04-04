part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState(this.response,
      {required this.cubitStatus, required this.message});
  final CubitStatus cubitStatus;
  final String message;
  final dynamic response;

  factory AuthState.initial() {
    return const AuthState(
      null,
      cubitStatus: CubitStatus.initial,
      message: "",
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object> get props => [message, cubitStatus];

  AuthState copyWith(
      {dynamic response, CubitStatus? cubitStatus, String? message}) {
    return AuthState(
      response ?? this.response,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      message: message ?? this.message,
    );
  }
}
