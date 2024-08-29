import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/user_creation_req.dart';
import '../../../service_locator.dart';
import '../repos/auth_repo.dart';

class SignupUsecase extends Usecase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq ? param}) async{
   return await sl<AuthRepo>().signup(param!);
  }
}
