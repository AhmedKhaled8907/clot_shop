import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/domain/product/entities/product_model.dart';
import 'package:clot_shop/presentation/product_details/widgets/product_images.dart';
import 'package:flutter/material.dart';

import '../widgets/product_price.dart';
import '../widgets/product_title.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity entity;

  const ProductDetailsPage({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductImages(entity: entity),
            const SizedBox(height: 16),
            ProductTitle(entity: entity),
            const SizedBox(height: 8),
            ProductPrice(entity: entity),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
