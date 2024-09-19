import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../repos/auth_repo.dart';

class GetUserUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic param}) async {
    return await sl<AuthRepo>().getUser();
  }
}
