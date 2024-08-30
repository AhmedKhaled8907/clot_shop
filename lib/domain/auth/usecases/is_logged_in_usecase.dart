import 'package:clot_shop/core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../repos/auth_repo.dart';

class IsLoggedInUsecase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) async {
    return await sl<AuthRepo>().isLoggedIn();
  }
}
