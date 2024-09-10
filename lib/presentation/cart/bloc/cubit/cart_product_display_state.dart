part of 'cart_product_display_cubit.dart';

@immutable
sealed class CartProductDisplayState {}

final class CartProductDisplayInitial extends CartProductDisplayState {}

final class CartProductDisplayLoading extends CartProductDisplayState {}

final class CartProductDisplayLoaded extends CartProductDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductDisplayLoaded({required this.products});
}

final class CartProductDisplayFailure extends CartProductDisplayState {
  final String errMessage;

  CartProductDisplayFailure({required this.errMessage});
}
