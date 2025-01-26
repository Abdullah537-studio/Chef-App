part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  const EditProfileState(
      {required this.isLoading,
      required this.status,
      this.message,
      this.response});
  final bool? isLoading;
  final CubitStatus status;
  final String? message;
  final EditProfileResponse? response;
  factory EditProfileState.initial() {
    return const EditProfileState(
      status: CubitStatus.initial,
      isLoading: false,
    );
  }
  EditProfileState copyWith({
    CubitStatus? status,
    String? message,
    EditProfileResponse? response,
    bool? isLoading,
  }) {
    return EditProfileState(
        status: status ?? this.status,
        message: message ?? this.message,
        response: response ?? this.response,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [status, message, response, isLoading];
}
