import 'package:clot_shop/domain/product/entities/product_model.dart';
import 'package:clot_shop/domain/product/usecases/get_top_selling_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';

part 'top_selling_state.dart';

class TopSellingCubit extends Cubit<TopSellingState> {
  TopSellingCubit() : super(TopSellingInitial());

  Future<void> getTopSellingProducts() async {
    emit(TopSellingLoading());

    final products = await sl<GetTopSellingUsecase>().call();
    products.fold(
      (failure) => emit(
        TopSellingFailure(errorMessage: failure),
      ),
      (data) => emit(
        TopSellingLoaded(products: data),
      ),
    );
  }
}
