part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductEmpty extends ProductState {
  final List<ProductEntity> products;

  ProductEmpty({required this.products});

}

final class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductLoaded({required this.products});
}

final class ProductFailure extends ProductState {
  final String message;

  ProductFailure({required this.message});
}
