import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/order/entity/order_entity.dart';
import '../../../../domain/order/usecases/get_orders_usecase.dart';

part 'orders_display_state.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersDisplayInitial());

  Future<void> displayOrders() async {
    emit(OrdersDisplayLoading());

    var result = await sl<GetOrdersUsecase>().call();
    result.fold(
      (failure) => emit(
        OrdersDisplayFailure(errMessage: failure),
      ),
      (data) => emit(
        OrdersDisplayLoaded(orders: data),
      ),
    );
  }
}
