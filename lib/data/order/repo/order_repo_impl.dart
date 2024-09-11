import 'package:clot_shop/data/order/models/product_ordered_model.dart';
import 'package:clot_shop/data/order/sources/order_firebase_source.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/order/repo/order_repo.dart';
import '../../../service_locator.dart';
import '../models/add_to_cart_req.dart';

class OrderRepoImpl extends OrderRepo {
  @override
  Future<Either> addToCart(AddToCartReq cart) async {
    return await sl<OrderFirebaseSource>().addToCart(cart);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseSource>().getCartProducts();
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map((e) => ProductOrderedModel.fromMap(e).toEntity())
            .toList(),
      ),
    );
  }

  @override
  Future<Either> deleteProductById(String productId) async {
    return await sl<OrderFirebaseSource>().deleteProductById(productId);
  }
}
