
class ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final String productImage;
  final int productQuantity;
  final String productSize;
  final String productColor;
  final double productPrice;
  final double totalPrice;
  final String createAt;

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
  });
}
