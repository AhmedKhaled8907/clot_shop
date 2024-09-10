import 'package:flutter/material.dart';

import '../../../common/helper/product/product_price_helper.dart';
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
    var price = ProductPriceHelper.provideCurrentPrice(entity);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        '\$$price',
        style: const TextStyle(
          fontSize: 22,
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
