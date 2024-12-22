part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.cubitStatus,
    required this.message,
    required this.chef,
  });
  final CubitStatus cubitStatus;
  final Chef chef;

  final String message;

  factory ProfileState.initial() {
    return ProfileState(
      cubitStatus: CubitStatus.initial,
      message: "",
      chef: Chef(),
    );
  }

  ProfileState copyWith(
      {CubitStatus? cubitStatus, String? message, Chef? chef}) {
    return ProfileState(
      cubitStatus: cubitStatus ?? this.cubitStatus,
      message: message ?? this.message,
      chef: chef ?? this.chef,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object> get props => [message, cubitStatus];
}
