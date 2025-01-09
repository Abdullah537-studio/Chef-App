import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:chef_app/features/auth/presentation/cubits/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterState.initial());
  final RegisterUsecase registerUsecase;

  Future<void> register(
      {required RegisterRequestModel registerRequestModel}) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final registerData =
        await registerUsecase(registerRequestModel: registerRequestModel);
    registerData.fold((failure) {
      try {
        if (isClosed) {
          return;
        }
        emit(state.copyWith(
          cubitStatus: CubitStatus.error,
          message: failure.errorMessage,
        ));
      } catch (e) {
        emit(state.copyWith(
          cubitStatus: CubitStatus.error,
          message: e.toString(),
        ));
      }
    }, (response) {
      emit(state.copyWith(
        cubitStatus: CubitStatus.loaded,
        response: response,
        message: response.message,
      ));
    });
  }
}
