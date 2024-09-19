import 'package:clot_shop/data/order/models/product_ordered_model.dart';
import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRegistrationReq {
  final String shippingAddress;
  final String paymentMethod;
  final List<ProductOrderedEntity> products;
  final Timestamp createdAt;
  final int itemsCount;
  final double totalPrice;

  OrderRegistrationReq({
    required this.shippingAddress,
    required this.products,
    required this.createdAt,
    required this.itemsCount,
    required this.totalPrice,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shippingAddress': shippingAddress,
      'products': products.map((x) => x.fromEntity().toMap()).toList(),
      'createdAt': createdAt,
      'itemsCount': itemsCount,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
    };
  }
}
