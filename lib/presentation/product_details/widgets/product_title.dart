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
    return Text(
      entity.title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
