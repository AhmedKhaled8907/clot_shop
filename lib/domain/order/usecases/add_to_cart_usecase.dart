import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:clot_shop/domain/order/repo/order_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../data/order/models/add_to_cart_req.dart';
import '../../../core/services/service_locator.dart';

class AddToCartUsecase extends Usecase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? param}) async {
    return await sl<OrderRepo>().addToCart(param!);
  }
}
