import 'package:clot_shop/common/helper/bloc/product/cubit/product_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/common/widgets/product/product_grid_view.dart';
import 'package:clot_shop/domain/product/usecases/get_favorite_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(usecase: sl<GetFavoriteProductsUsecase>())
            ..getProducts(),
      child: Scaffold(
        appBar: const BasicAppBar(
          title: Text(
            'Favorites',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
              if (state.products.isEmpty) {
                return const Center(
                  child: Text(
                    'No favorite products found.',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: ProductGridView(state: state),
              );
            }
            if (state is ProductFailure) {
              return const Center(
                child: Text(
                  'Failed to load products. Please try again.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              );
            }
            return Container(); 
          },
        ),
      ),
    );
  }
}
