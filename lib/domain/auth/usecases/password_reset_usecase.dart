import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../repos/auth_repo.dart';

class PasswordResetUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? param}) async {
    return await sl<AuthRepo>().sendPasswordResetEmail(param!);
  }
}
