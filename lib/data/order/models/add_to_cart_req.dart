import 'package:cloud_firestore/cloud_firestore.dart';

class AddToCartReq {
  final String productId;
  final String productTitle;
  final String productImage;
  final int productQuantity;
  final String productSize;
  final String productColor;
  final double productPrice;
  final double totalPrice;
  final Timestamp createAt;

  AddToCartReq({
    required this.productId,
    required this.productTitle,
    required this.productImage,
    required this.productQuantity,
    required this.productSize,
    required this.productColor,
    required this.productPrice,
    required this.totalPrice,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'productSize': productSize,
      'productColor': productColor,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'createAt': createAt,
    };
  }
}
