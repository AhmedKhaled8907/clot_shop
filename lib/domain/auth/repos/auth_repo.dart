import 'package:clot_shop/data/auth/models/user_creation_req.dart';
import 'package:clot_shop/data/auth/models/user_info_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> signin(UserInfoModel user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> signOut();
}
