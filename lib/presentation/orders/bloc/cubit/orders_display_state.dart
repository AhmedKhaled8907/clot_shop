part of 'orders_display_cubit.dart';

@immutable
sealed class OrdersDisplayState {}

final class OrdersDisplayInitial extends OrdersDisplayState {}

final class OrdersDisplayLoading extends OrdersDisplayState {}

final class OrdersDisplayLoaded extends OrdersDisplayState {
  final List<OrderEntity> orders;
  OrdersDisplayLoaded({required this.orders});
}

final class OrdersDisplayFailure extends OrdersDisplayState {
  final String errMessage;

  OrdersDisplayFailure({required this.errMessage});
}
