// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../../domain/product/entities/product_color_model.dart';

class ProductColorModel {
  final String title;
  final String hasCode;

  ProductColorModel({
    required this.title,
    required this.hasCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hasCode': hasCode,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      hasCode: map['hasCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      hasCode: hasCode,
    );
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(
      title: title,
      hasCode: hasCode,
    );
  }
}
