import 'package:clot_shop/data/auth/models/user_creation_req.dart';
import 'package:clot_shop/data/auth/models/user_info_model.dart';
import 'package:clot_shop/data/auth/models/user_model.dart';
import 'package:clot_shop/data/auth/source/auth_firebase_source.dart';
import 'package:clot_shop/core/services/service_locator.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/auth/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseSource>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseSource>().getAges();
  }

  @override
  Future<Either> signin(UserInfoModel user) async {
    return await sl<AuthFirebaseSource>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseSource>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseSource>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseSource>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
        UserModel.fromMap(data).toEntity(),
      );
    });
  }
}
