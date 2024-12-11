import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/usecases/login_usecases.dart';
import 'package:chef_app/strings/key_cache_value.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _storage = SecureStorageHelper();
  final LoginUsecases loginUsecases;
  LoginResponseModel loginResponseModel =
      const LoginResponseModel(message: "", token: "");
  AuthCubit(this.loginUsecases) : super(AuthState.initial());
  Future<void> login({required LoginRequiestModel loginRequiestModel}) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final loginData =
        await loginUsecases(loginRequiestModel: loginRequiestModel);
    loginData.fold((failure) {
      String errorMessage = failure.errorModel!.errorMessage;
      emit(state.copyWith(
          cubitStatus: CubitStatus.error, message: errorMessage));
    }, (response) {
      loginResponseModel = response;
      _storage.saveData(
          key: AppKeyCache.token, value: loginResponseModel.token);

      emit(state.copyWith(cubitStatus: CubitStatus.loaded));
    });
  }
}
