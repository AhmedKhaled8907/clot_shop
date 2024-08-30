// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../domain/category/entities/category_entity.dart';

class CategoryModel {
  final String categoryId;
  final String title;
  final String image;

  CategoryModel({
    required this.categoryId,
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId:
          map['categoryId'] as String? ?? '', // Provide a default empty string
      title: map['title'] as String? ?? 'Untitled', // Provide a default title
      image: map['image'] as String? ??
          '', // Provide a default image URL or leave empty
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      title: title,
      image: image,
    );
  }
}
