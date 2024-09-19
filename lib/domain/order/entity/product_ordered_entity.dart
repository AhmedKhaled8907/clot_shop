
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final String productImage;
  final int productQuantity;
  final String productSize;
  final String productColor;
  final num productPrice;
  final num totalPrice;
  final Timestamp createAt;
  final String id;

  ProductOrderedEntity({
    required this.productId,
    required this.productTitle,
    required this.productImage,
    required this.productQuantity,
    required this.productSize,
    required this.productColor,
    required this.productPrice,
    required this.totalPrice,
    required this.createAt,
    required this.id,
  });
}
