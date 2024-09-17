import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:clot_shop/data/order/models/order_registration_req.dart';
import 'package:clot_shop/domain/order/repo/order_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../service_locator.dart';

class OrderRegistrationUsecase extends Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? param}) async {
    return await sl<OrderRepo>().orderRegistration(param!);
  }
}
