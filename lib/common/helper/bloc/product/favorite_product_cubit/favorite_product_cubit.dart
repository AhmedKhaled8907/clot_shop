import 'package:clot_shop/domain/product/entities/product_entity.dart';
import 'package:clot_shop/domain/product/usecases/add_or_remove_favorite_product_usecase.dart';
import 'package:clot_shop/domain/product/usecases/is_favorite_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../service_locator.dart';

class FavoriteProductCubit extends Cubit<bool> {
  FavoriteProductCubit() : super(false);

  void isFavorite({required String productId}) async {
    var result = await sl<IsFavoriteUsecase>().call(
      param: productId,
    );
    emit(result);
  }

  void addOrRemoveFavoriteProduct({required ProductEntity entity}) async {
    var result =
        await sl<AddOrRemoveFavoriteProductUsecase>().call(param: entity);
    result.fold(
      (failure) => emit(failure),
      (data) => emit(data),
    );
  }
}
