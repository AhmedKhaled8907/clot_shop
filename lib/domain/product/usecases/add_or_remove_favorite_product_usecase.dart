import 'package:clot_shop/domain/product/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../repos/product_repo.dart';

class AddOrRemoveFavoriteProductUsecase extends Usecase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? param}) async {
    return await sl<ProductRepo>().addOrRemoveFavoriteProduct(entity: param!);
  }
}
