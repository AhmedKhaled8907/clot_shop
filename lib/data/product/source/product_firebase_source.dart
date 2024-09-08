import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseSource {
  Future<Either> getTopSelling();
}

class ProductFirebaseSourceImpl implements ProductFirebaseSource {
  var auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;

  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await fireStore
          .collection('products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .orderBy('salesNumber', descending: true)
          .get();
      return Right((returnedData.docs.map(
        (e) => e.data(),
      )).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
