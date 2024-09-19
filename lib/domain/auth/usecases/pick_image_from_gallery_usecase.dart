import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:clot_shop/domain/auth/entities/user_entity.dart';

import '../../../core/services/service_locator.dart';
import '../repos/auth_repo.dart';

class PickImageFromGalleryUsecase extends Usecase<UserEntity?, dynamic> {
  @override
  Future<UserEntity?> call({param}) async {
    return await sl<AuthRepo>().pickImageFromGallery();
  }
}
