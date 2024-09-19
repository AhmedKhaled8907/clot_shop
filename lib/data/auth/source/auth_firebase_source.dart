import 'package:clot_shop/data/auth/models/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseSource {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> signin(UserInfoModel user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> signOut();
}

class AuthFirebaseSourceImpl implements AuthFirebaseSource {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData = await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      var uid = returnedData.user!.uid;
      _fireStore.collection('users').doc(uid).set({
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
      var returnedData = await _fireStore
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
      var returnedData = await _auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      // to make the password change in the database if the user resets the password
      var uid = returnedData.user!.uid;
      _fireStore.collection('users').doc(uid).update({
        'password': user.password,
      });

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

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      // Step 1: Check if the email exists in Firestore
      var querySnapshot = await _fireStore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return const Left('No user found for that email.');
      }

      // Step 2: Send the password reset email if the email exists
      await _auth.sendPasswordResetEmail(email: email);
      return const Right('Password Reset Email sent');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Invalid email format.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      }
      return Left(message);
    } catch (e) {
      return const Left('An unexpected error occurred.');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = _auth.currentUser;
      var userData = await _fireStore
          .collection('users')
          .doc(currentUser!.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return const Left('Try again later!');
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      await _auth.signOut();
      return const Right('Signed Out was Successful');
    } catch (e) {
      return const Left('Try again later!');
    }
  }
}
