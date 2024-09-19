import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:clot_shop/domain/order/repo/order_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';

class DeleteProductByIdUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? param}) async {
    return await sl<OrderRepo>().deleteProductById(param!);
  }
}
