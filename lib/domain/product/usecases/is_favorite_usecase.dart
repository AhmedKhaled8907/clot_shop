import '../../../core/usecases/usecase.dart';
import '../../../core/services/service_locator.dart';
import '../repos/product_repo.dart';

class IsFavoriteUsecase extends Usecase<bool, String> {
  @override
  Future<bool> call({String? param}) async {
    return await sl<ProductRepo>().isFavorite(productId: param!);
  }
}
