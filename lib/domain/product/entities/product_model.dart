// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clot_shop/domain/product/entities/product_color_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  final String categoryId;
  final List<ProductColorEntity> colors;
  final Timestamp createdAt;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<int> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductEntity({
    required this.categoryId,
    required this.colors,
    required this.createdAt,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });
}
