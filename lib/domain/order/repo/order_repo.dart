import 'package:clot_shop/data/order/models/add_to_cart_req.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  Future<Either> addToCart(AddToCartReq cart);
  Future<Either> getCartProducts();
  Future<Either> deleteProductById(String productId);
}
