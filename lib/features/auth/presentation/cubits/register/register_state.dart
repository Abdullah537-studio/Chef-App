import 'package:equatable/equatable.dart';
import 'package:chef_app/core/enum/cubit_status.dart';

class RegisterState extends Equatable {
  const RegisterState(this.response,
      {required this.cubitStatus, required this.message});
  final CubitStatus cubitStatus;
  final String message;
  final dynamic response;

  factory RegisterState.initial() {
    return const RegisterState(
      null,
      cubitStatus: CubitStatus.initial,
      message: "",
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object> get props => [message, cubitStatus];

  RegisterState copyWith(
      {dynamic response, CubitStatus? cubitStatus, String? message}) {
    return RegisterState(
      response ?? this.response,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      message: message ?? this.message,
    );
  }
}
