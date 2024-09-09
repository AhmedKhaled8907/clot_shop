import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_model.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.entity,
  });

  final ProductEntity entity;

  @override
  Widget build(BuildContext context) {
    final productPriceText = entity.discountedPrice != 0
        ? entity.discountedPrice.toString()
        : entity.price.toString();

    return Text(
      '\$$productPriceText',
      style: const TextStyle(
        fontSize: 20,
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
