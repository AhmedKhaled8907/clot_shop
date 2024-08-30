import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CategoryFirebaseSource {
  Future<Either> getCategories();
}

class CategoryFirebaseSourceImpl implements CategoryFirebaseSource {
  var auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;
  @override
  Future<Either> getCategories() async {
    try {
      var categories = await fireStore.collection('categories').orderBy('title').get();
      return Right(categories.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
