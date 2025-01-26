part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  const EditProfileState({required this.status, this.message, this.response});
  final CubitStatus status;
  final String? message;
  final EditProfileResponse? response;
  factory EditProfileState.initial() {
    return const EditProfileState(status: CubitStatus.initial);
  }
  EditProfileState copyWith({
    CubitStatus? status,
    String? message,
    EditProfileResponse? response,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      message: message ?? this.message,
      response: response ?? this.response,
    );
  }

  @override
  List<Object> get props => [status, message ?? "", response ?? ""];
}
