import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/remote/api_url.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/usecases/send_code_usecase.dart';
import 'package:chef_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _storage = CacheHelper();
  //? login
  final LoginUsecase loginUsecase;
  LoginResponseModel loginResponseModel = const LoginResponseModel(
    message: "",
    token: "",
  );
  //? forget password
  final SendCodeUsecase sendCodeUsecase;

  AuthCubit(
    this.loginUsecase,
    this.sendCodeUsecase,
  ) : super(AuthState.initial());

  Future<void> login({required LoginRequiestModel loginRequiestModel}) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final loginData =
        await loginUsecase(loginRequiestModel: loginRequiestModel);
    loginData.fold((failure) {
      try {
        String errorMessage = failure.errorMessage;
        emit(state.copyWith(
            cubitStatus: CubitStatus.error, message: errorMessage));
      } catch (e) {
        emit(state.copyWith(
          cubitStatus: CubitStatus.error,
          message: e.toString(),
        ));
      }
    }, (response) {
      loginResponseModel = response;
      _storage.saveData(key: ApiKey.token, value: loginResponseModel.token);

      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(loginResponseModel.token);
      _storage.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      print(response.token);
      print(decodedToken[ApiKey.id]);
      emit(state.copyWith(cubitStatus: CubitStatus.loaded));
    });
  }

  Future<void> sendCodePassword(
      {required SendCodeRequistModel sendCodeRequistModel}) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final sendCodeData = await sendCodeUsecase(
      sendCodeRequistModel: sendCodeRequistModel,
    );
    sendCodeData.fold(
      (failure) {
        try {
          String message = failure.errorMessage;
          emit(
            state.copyWith(
              cubitStatus: CubitStatus.error,
              message: message,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              cubitStatus: CubitStatus.error,
              message: e.toString(),
            ),
          );
        }
      },
      (response) {
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
