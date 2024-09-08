import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseSource {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategory({
    required String categoryId,
  });
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
          .where(
            'createdAt',
            isGreaterThanOrEqualTo: DateTime.now().subtract(
              const Duration(days: 1),
            ),
          )
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
}
