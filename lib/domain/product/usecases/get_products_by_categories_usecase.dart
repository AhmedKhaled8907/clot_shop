import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../../../core/services/service_locator.dart';
import '../repos/product_repo.dart';

class GetProductsByCategoriesUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? param}) async {
    return await sl<ProductRepo>().getProductsByCategoryId(categoryId: param!);
  }
}
