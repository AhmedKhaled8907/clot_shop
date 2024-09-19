import 'package:clot_shop/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../repos/category_repo.dart';

class GetCategoriesUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<CategoryRepo>().getCategories();
  }
}
