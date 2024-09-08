

import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../repos/product_repo.dart';

class GetTopSellingUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<ProductRepo>().getTopSelling();
  }
}
