import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_req.dart';

abstract class OrderFirebaseSource {
  Future<Either> addToCart(AddToCartReq cart);
  Future<Either> getCartProducts();
  Future<Either> deleteProductById(String productId);
}

class OrderFirebaseSourceImpl extends OrderFirebaseSource {
  var firebase = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;

  @override
  Future<Either> addToCart(AddToCartReq cart) async {
    try {
      var currentUser = firebase.currentUser;
      var uid = currentUser!.uid;
      await firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .add(cart.toMap());
      return const Right('Added to cart!');
    } catch (e) {
      return const Left('Try again later!');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    var uid = firebase.currentUser!.uid;
    try {
      var returnedData = await firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .orderBy('createAt', descending: true)
          .get();

      var products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }

      return Right(products);
    } catch (e) {
      return const Left('Try again later!');
    }
  }

  @override
  Future<Either> deleteProductById(String productId) async {
    var uid = firebase.currentUser!.uid;
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(productId)
          .delete();
      return const Right('Deleting is a success!');
    } catch (e) {
      return const Left('Try again later!');
    }
  }

}