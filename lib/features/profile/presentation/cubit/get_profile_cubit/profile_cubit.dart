import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:chef_app/features/profile/domain/usecases/get_chef_data_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getChefUseCase, this.editProfileUseCase)
      : super(ProfileState.initial());
  final GetChefDataUsecase getChefUseCase;
  final EditProfileUsecase editProfileUseCase;
  EditProfileRequest? data;
  Future<void> getChefData() async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final getChefData = await getChefUseCase();
    getChefData.fold(
      (faliure) {
        try {
          if (isClosed) return;

          emit(state.copyWith(
              cubitStatus: CubitStatus.error, message: faliure.errorMessage));
        } catch (e) {
          emit(state.copyWith(
            cubitStatus: CubitStatus.error,
            message: e.toString(),
          ));
        }
      },
      (response) {
        data = EditProfileRequest(
          name: response.chef?.name,
          location: response.chef?.location,
          phone: response.chef?.phone,
          brandName: response.chef?.brandName,
          minCharge: response.chef?.minCharge,
          disc: response.chef?.disc,
          profilePic: response.chef?.profilePic,
        );
        emit(state.copyWith(
          cubitStatus: CubitStatus.loaded,
          chef: response.chef,
        ));
      },
    );
  }

  Future<void> edit({required EditProfileRequest editProfileRequest}) async {
    if (isClosed) return;

    emit(state.copyWith(cubitStatus: CubitStatus.loading));

    final result =
        await editProfileUseCase.call(editProfileRequest: editProfileRequest);

    result.fold(
      (failure) {
        if (isClosed) return;

        emit(
          state.copyWith(
            cubitStatus: CubitStatus.error,
            message: failure.errorMessage,
          ),
        );
      },
      (response) {
        if (isClosed) return;

        emit(
          state.copyWith(
            cubitStatus: CubitStatus.loaded,
            message: response.message,
          ),
        );
      },
    );
  }
}
