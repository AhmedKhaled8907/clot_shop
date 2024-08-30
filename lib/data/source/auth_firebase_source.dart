import 'package:clot_shop/data/models/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseSource {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> signin(UserInfoModel user);
}

class AuthFirebaseSourceImpl implements AuthFirebaseSource {
  var auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData = await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      var uid = returnedData.user!.uid;
      fireStore.collection('users').doc(uid).set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'password': user.password,
        'gender': user.gender,
        'age': user.age,
      });
      return const Right('Signed Up was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email is badly formatted.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData = await fireStore
          .collection('ages')
          .orderBy(
            descending: false,
            'value',
          )
          .get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Try again later');
    }
  }

  @override
  Future<Either> signin(UserInfoModel user) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return const Right('Signed In was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-credentials') {
        message = 'Wrong credentials provided for that user.';
      }
      return Left(message);
    }
  }
}
