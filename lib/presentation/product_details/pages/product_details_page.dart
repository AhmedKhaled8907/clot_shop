import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/domain/product/entities/product_entity.dart';
import 'package:clot_shop/presentation/product_details/widgets/product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_color_selection_cubit.dart';
import '../bloc/product_quantity_cubit.dart';
import '../bloc/product_size_selection_cubit.dart';
import '../widgets/add_to_cart.dart';
import '../widgets/selected_color.dart';
import '../widgets/product_price.dart';
import '../widgets/product_quantity.dart';
import '../widgets/selected_size.dart';
import '../widgets/product_title.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity entity;

  const ProductDetailsPage({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
      ],
      child: Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                SelectedSize(entity: entity),
                const SizedBox(height: 16),
                SelectedColors(entity: entity),
                const SizedBox(height: 16),
                ProductQuantity(entity: entity),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddToCart(entity: entity),
      ),
    );
  }
}
