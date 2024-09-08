part of 'top_selling_cubit.dart';

@immutable
sealed class TopSellingState {}

final class TopSellingInitial extends TopSellingState {}

final class TopSellingLoading extends TopSellingState {}

final class TopSellingLoaded extends TopSellingState {
  final List<ProductEntity> products;

  TopSellingLoaded({required this.products});
}

final class TopSellingFailure extends TopSellingState {
  final String errorMessage;

  TopSellingFailure({required this.errorMessage});
}
