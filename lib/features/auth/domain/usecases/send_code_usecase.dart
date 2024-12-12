import 'package:chef_app/core/database/error/error_model.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/domain/entities/response/send_code_response_model.dart';
import 'package:chef_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SendCodeUsecase {
  final AuthRepository repository;

  const SendCodeUsecase({required this.repository});
  Future<Either<ErrorModel, SendCodeResponseModel>> call(
      {required SendCodeRequistModel sendCodeRequistModel}) async {
    return await repository.sendCode(
      sendCodeRequistModel: sendCodeRequistModel,
    );
  }
}
