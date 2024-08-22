import 'package:clot_shop/data/models/user_creation_req.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either> signup(UserCreationReq user);
}
