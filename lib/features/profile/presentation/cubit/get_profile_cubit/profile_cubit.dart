import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/usecases/get_chef_data_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.usecase) : super(ProfileState.initial());
  final GetChefDataUsecase usecase;
  Future<void> getChefData() async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final getChefData = await usecase();
    getChefData.fold(
      (faliure) {
        try {
          if (isClosed) {
            return;
          }
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
        emit(state.copyWith(
          cubitStatus: CubitStatus.loaded,
          chef: response.chef,
        ));
      },
    );
  }
}
