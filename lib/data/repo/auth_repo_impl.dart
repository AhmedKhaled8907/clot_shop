import 'package:clot_shop/data/models/user_creation_req.dart';
import 'package:clot_shop/data/source/auth_firebase_source.dart';
import 'package:clot_shop/service_locator.dart';

import 'package:dartz/dartz.dart';

import '../../domain/auth/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseSource>().signup(user);
  }
}
