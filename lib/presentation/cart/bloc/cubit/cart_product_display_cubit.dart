import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/order/usecases/get_cart_products_usecase.dart';
import '../../../../service_locator.dart';

part 'cart_product_display_state.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductDisplayInitial());

  Future<void> getCartProducts() async {
    emit(CartProductDisplayLoading());
    var returnedData = await sl<GetCartProductsUsecase>().call();
    returnedData.fold(
      (error) => emit(
        CartProductDisplayFailure(errMessage: error),
      ),
      (data) => emit(
        CartProductDisplayLoaded(products: data),
      ),
    );
  }
}
