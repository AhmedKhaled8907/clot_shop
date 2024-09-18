import 'package:clot_shop/domain/product/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/product/repos/product_repo.dart';
import '../../../service_locator.dart';
import '../models/product_model.dart';
import '../source/Product_firebase_source.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseSource>().getTopSelling();
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseSource>().getNewIn();
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> getProductsByCategoryId({required String categoryId}) async {
    var returnedData = await sl<ProductFirebaseSource>()
        .getProductsByCategory(categoryId: categoryId);
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> getProductsByTitle({required String title}) async {
    var returnedData =
        await sl<ProductFirebaseSource>().getProductsByTitle(title: title);
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(
      {required ProductEntity entity}) async {
    var returnedData = await sl<ProductFirebaseSource>()
        .addOrRemoveFavoriteProduct(entity: entity);
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(data),
    );
  }

  @override
  Future<bool> isFavorite({required String productId}) async {
    return await sl<ProductFirebaseSource>().isFavorite(productId: productId);
  }

  @override
  Future<Either> getFavoriteProducts() async {
    var returnedData = await sl<ProductFirebaseSource>().getFavoriteProducts();
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      ),
    );
  }
}
