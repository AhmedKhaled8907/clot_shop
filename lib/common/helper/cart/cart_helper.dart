import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';

class CartHelper {
  static double calculateSubTotal(List<ProductOrderedEntity> products) {
    double subTotal = 0;
    for (var product in products) {
      subTotal += product.totalPrice;
    }
    return subTotal;
  }
}
