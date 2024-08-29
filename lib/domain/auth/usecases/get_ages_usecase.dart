import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../service_locator.dart';
import '../repos/auth_repo.dart';

class GetAgesUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic param}) async {
    return await sl<AuthRepo>().getAges();
  }
}
