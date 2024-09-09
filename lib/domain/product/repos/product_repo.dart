import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId({
    required String categoryId,
  });
  Future<Either> getProductsByTitle({
    required String title,
  });
}
