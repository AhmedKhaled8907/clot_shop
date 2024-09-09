import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/domain/product/entities/product_model.dart';
import 'package:clot_shop/presentation/product_details/widgets/product_images.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          ProductImages(entity: entity),
        ],
      ),
    );
  }
}
