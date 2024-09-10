import 'package:flutter/material.dart';

import '../../../domain/product/entities/product_model.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.entity,
  });

  final ProductEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        entity.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
