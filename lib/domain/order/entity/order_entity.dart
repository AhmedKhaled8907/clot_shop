import 'package:clot_shop/domain/order/entity/order_status_entity.dart';
import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderEntity {
  final String shippingAddress;
  final String paymentMethod;
  final List<ProductOrderedEntity> products;
  final Timestamp createdAt;
  final int itemsCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.shippingAddress,
    required this.products,
    required this.createdAt,
    required this.itemsCount,
    required this.totalPrice,
    required this.paymentMethod,
    required this.code,
    required this.orderStatus,
  });
}
