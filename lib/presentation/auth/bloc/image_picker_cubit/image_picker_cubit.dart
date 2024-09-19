import 'package:clot_shop/core/services/service_locator.dart';
import 'package:clot_shop/domain/auth/entities/user_entity.dart';
import 'package:clot_shop/domain/auth/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerCubit extends Cubit<UserEntity?> {

  ImagePickerCubit() : super(null);

  void pickImageFromCamera() async {
    final image = await sl<AuthRepo>().pickImageFromCamera();
    emit(image);
  }

  void pickImageFromGallery() async {
    final image = await sl<AuthRepo>().pickImageFromGallery();
    emit(image);
  }

  void removeImage() {
    sl<AuthRepo>().removeImage();
    emit(null);
  }
}
