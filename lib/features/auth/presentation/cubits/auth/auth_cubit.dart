import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/remote/api_url.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/login_response_model.dart';
import 'package:chef_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:chef_app/features/auth/domain/usecases/send_code_usecase.dart';
import 'package:chef_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _storage = CacheHelper();
  //? login
  final LoginUsecase loginUsecase;
  LoginResponseModel loginResponseModel = const LoginResponseModel();
  //? register
  final RegisterUsecase registerUsecase;
  //? forget password
  final SendCodeUsecase sendCodeUsecase;

  AuthCubit(
    this.loginUsecase,
    this.sendCodeUsecase,
    this.registerUsecase,
  ) : super(AuthState.initial());

  Future<void> login({required LoginRequiestModel loginRequiestModel}) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));
    final loginData =
        await loginUsecase(loginRequiestModel: loginRequiestModel);
    loginData.fold((failure) {
      try {
        if (isClosed) {
          return;
        }
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
      //? cache token
      _storage.saveData(
          key: ApiKey.token, value: loginResponseModel.token ?? '');
      //? cache id
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(loginResponseModel.token ?? '');
      String id = decodedToken[ApiKey.id];

      _storage.saveData(key: ApiKey.id, value: id);
      debugPrint(response.token);
      debugPrint(decodedToken[ApiKey.id]);

      emit(state.copyWith(cubitStatus: CubitStatus.loaded, response: response));
    });
  }

  // Future<void> register(
  //     {required RegisterRequiestModel registerRequiestModel}) async {
  //   emit(state.copyWith(cubitStatus: CubitStatus.loading));
  //   final registerData =
  //       await registerUsecase(registerRequiestModel: registerRequiestModel);
  //   registerData.fold((failure) {
  //     try {
  //       emit(state.copyWith(
  //         cubitStatus: CubitStatus.error,
  //         message: failure.errorMessage,
  //       ));
  //     } catch (e) {
  //       emit(state.copyWith(
  //         cubitStatus: CubitStatus.error,
  //         message: e.toString(),
  //       ));
  //     }
  //   }, (response) {
  //     emit(state.copyWith(
  //       cubitStatus: CubitStatus.loaded,
  //       response: response,
  //       message: response.message,
  //     ));
  //   });
  // }

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
