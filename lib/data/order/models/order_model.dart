import 'package:clot_shop/data/order/models/product_ordered_model.dart';
import 'package:clot_shop/domain/order/entity/order_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String shippingAddress;
  final String paymentMethod;
  final List<ProductOrderedModel> products;
  final Timestamp createdAt;
  final int itemsCount;
  final double totalPrice;
  final String? code;

  OrderModel({
    required this.shippingAddress,
    required this.products,
    required this.createdAt,
    required this.itemsCount,
    required this.totalPrice,
    required this.paymentMethod,
    required this.code,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      shippingAddress: map['shippingAddress'] as String,
      paymentMethod: map['paymentMethod'] as String,
      products: List<ProductOrderedModel>.from(
        map['products'].map((e) => ProductOrderedModel.fromMap(e)),
      ),
      createdAt: map['createdAt'] as Timestamp,
      itemsCount: map['itemsCount'] as int,
      totalPrice: map['totalPrice'] as double,
      code:  map['code'] != null ? map['code'] as String : '456231',
      
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      shippingAddress: shippingAddress,
      paymentMethod: paymentMethod,
      products: products.map((e) => e.toEntity()).toList(),
      createdAt: createdAt,
      itemsCount: itemsCount,
      totalPrice: totalPrice,
      code: code!,
    );
  }
}
