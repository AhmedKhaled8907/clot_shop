import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:clot_shop/data/models/user_info_model.dart';
import 'package:dartz/dartz.dart';

import '../../../service_locator.dart';
import '../repos/auth_repo.dart';

class SigninUsecase extends Usecase<Either, UserInfoModel> {
  @override
  Future<Either> call({UserInfoModel? param}) async {
    return await sl<AuthRepo>().signin(param!);
  }
}
