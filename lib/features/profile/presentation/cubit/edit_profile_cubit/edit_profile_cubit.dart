import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/domain/entities/response/edit_profile_response.dart';
import 'package:chef_app/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:equatable/equatable.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.usecase) : super(EditProfileState.initial());
  final EditProfileUsecase usecase;

  Future<void> edit({required EditProfileRequest editProfileRequest}) async {
    if (isClosed) return;

    emit(state.copyWith(status: CubitStatus.loading));

    final result = await usecase.call(editProfileRequest: editProfileRequest);

    result.fold(
      (failure) {
        if (isClosed) return;

        emit(
          state.copyWith(
            status: CubitStatus.error,
            message: failure.errorMessage,
          ),
        );
      },
      (response) {
        if (isClosed) return;

        emit(
          state.copyWith(
            status: CubitStatus.loaded,
            response: response,
            message: "Profile updated successfully",
          ),
        );
      },
    );
  }
}
