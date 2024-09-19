import 'package:clot_shop/core/usecases/usecase.dart';
import '../../../core/services/service_locator.dart';
import '../repos/auth_repo.dart';

class RemoveImageUsecase extends Usecase<void, dynamic> {
  @override
  Future<void> call({param}) async {
    return await sl<AuthRepo>().removeImage();
  }
}
