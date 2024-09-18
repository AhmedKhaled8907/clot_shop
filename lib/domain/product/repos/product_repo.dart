import 'package:clot_shop/domain/product/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId({required String categoryId});
  Future<Either> getProductsByTitle({required String title});
  Future<Either> addOrRemoveFavoriteProduct({required ProductEntity entity});
  Future<bool> isFavorite({required String productId});
  Future<Either> getFavoriteProducts();
}
