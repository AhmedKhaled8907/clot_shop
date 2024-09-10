import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final String productImage;
  final int productQuantity;
  final String productSize;
  final String productColor;
  final double productPrice;
  final double totalPrice;
  final String createAt;

  ProductOrderedModel({
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

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productImage: map['productImage'] as String,
      productQuantity: map['productQuantity'] as int,
      productSize: map['productSize'] as String,
      productColor: map['productColor'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      createAt: map['createAt'] as String,
    );
  }
}

extension ProductOrderedModelX on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productImage: productImage,
      productQuantity: productQuantity,
      productSize: productSize,
      productColor: productColor,
      productPrice: productPrice,
      totalPrice: totalPrice,
      createAt: createAt,
    );
  }
}
