import 'package:clot_shop/common/widgets/product/product_card.dart';
import 'package:flutter/material.dart';

import '../../helper/bloc/product/cubit/product_cubit.dart';

class ProductGridView extends StatelessWidget {
  final ProductLoaded state;
  const ProductGridView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.55,
      ),
      itemCount: state.products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          productEntity: state.products[index],
        );
      },
    );
  }
}
