import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_req.dart';
import '../models/order_registration_req.dart';

abstract class OrderFirebaseSource {
  Future<Either> addToCart(AddToCartReq cart);
  Future<Either> getCartProducts();
  Future<Either> deleteProductById(String productId);
  Future<Either> deleteCart();
  Future<Either> orderRegistration(OrderRegistrationReq order);
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

  @override
  Future<Either> deleteCart() async {
    var uid = firebase.currentUser!.uid;
    try {
      var cartItems =
          await firestore.collection('users').doc(uid).collection('cart').get();

      for (var item in cartItems.docs) {
        await firestore
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(item.id)
            .delete();
      }

      return const Right('All cart items deleted successfully!');
    } catch (e) {
      return const Left('Error occurred while deleting cart items.');
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var uid = firebase.currentUser!.uid;
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('orders')
          .add(order.toMap());

      for (var item in order.products) {
        await firestore
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(item.id)
            .delete();
      }

      return const Right('Order placed successfully!');
    } on FirebaseAuthException catch (e) {
      return Left(e);
    }
  }
}
