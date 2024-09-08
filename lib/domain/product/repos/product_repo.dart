import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
}
