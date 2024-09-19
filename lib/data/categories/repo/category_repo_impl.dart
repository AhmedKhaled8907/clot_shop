import 'package:dartz/dartz.dart';

import '../../../domain/category/repos/category_repo.dart';
import '../../../core/services/service_locator.dart';
import '../models/category_model.dart';
import '../source/category_firebase_source.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseSource>().getCategories();
    return categories.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map((e) => CategoryModel.fromMap(e).toEntity())
            .toList(),
      ),
    );
  }
}
