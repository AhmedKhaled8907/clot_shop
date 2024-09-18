import 'package:clot_shop/data/product/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/product/entities/product_entity.dart';

abstract class ProductFirebaseSource {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategory({required String categoryId});
  Future<Either> getProductsByTitle({required String title});
  Future<Either> addOrRemoveFavoriteProduct({required ProductEntity entity});
  Future<bool> isFavorite({required String productId});
  Future<Either> getFavoriteProducts();
}

class ProductFirebaseSourceImpl implements ProductFirebaseSource {
  var auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;

  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await fireStore
          .collection('products')
          .where('salesNumber', isGreaterThanOrEqualTo: 15)
          .orderBy('salesNumber', descending: true)
          .get();
      return Right((returnedData.docs.map(
        (e) => e.data(),
      )).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await fireStore
          .collection('products')
          // .where(
          //   'createdAt',
          //   isGreaterThanOrEqualTo: DateTime.now().subtract(
          //     const Duration(days: 1),
          //   ),
          // )
          .orderBy('createdAt', descending: true)
          .get();

      return Right((returnedData.docs.map((e) => e.data())).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByCategory({required String categoryId}) async {
    try {
      var returnedData = await fireStore
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      return Right((returnedData.docs.map((e) => e.data())).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByTitle({required String title}) async {
    try {
      var returnedData = await fireStore
          .collection('products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();

      return Right((returnedData.docs.map((e) => e.data())).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct({
    required ProductEntity entity,
  }) async {
    var uid = auth.currentUser!.uid;

    try {
      var favoriteProducts = await fireStore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .where('productId', isEqualTo: entity.productId)
          .get();

      if (favoriteProducts.docs.isNotEmpty) {
        await favoriteProducts.docs.first.reference.delete();
        return const Right(false);
      } else {
        await fireStore
            .collection('users')
            .doc(uid)
            .collection('favorites')
            .add(
              entity.fromEntity().toMap(),
            );
        return const Right(true);
      }
    } catch (e) {
      return const Left('Try again later!');
    }
  }

  @override
  Future<bool> isFavorite({required String productId}) async {
    var uid = auth.currentUser!.uid;

    try {
      var favoriteProducts = await fireStore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (favoriteProducts.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteProducts() async {
    var uid = auth.currentUser!.uid;

    try {
      var favoriteProducts = await fireStore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .get();

      return Right(favoriteProducts.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Try again later!');
    }
  }
}
