// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:clot_shop/domain/product/entities/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Usecase usecase;

  ProductCubit({required this.usecase}) : super(ProductInitial());

  Future<void> getProducts({dynamic params}) async {
    emit(ProductLoading());

    final products = await usecase.call(
      param: params,
    );
    products.fold(
      (failure) => emit(
        ProductFailure(message: failure),
      ),
      (data) => emit(
        ProductLoaded(products: data),
      ),
    );
  }
}
