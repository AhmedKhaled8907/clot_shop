import 'package:clot_shop/common/helper/bloc/product/cubit/product_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/common/widgets/product/product_grid_view.dart';
import 'package:clot_shop/core/configs/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/services/service_locator.dart';
import '../../../domain/product/usecases/get_favorite_products_usecase.dart';
import '../../root/pages/root_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        usecase: sl.call<GetFavoriteProductsUsecase>(),
      )..getProducts(),
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
                return _empty(context);
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

  Center _empty(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesHeart,
              fit: BoxFit.fill,
              height: 150,
            ),
            const SizedBox(height: 24),
            const Text(
              'No Favorites Found',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            BasicAppButton(
              width: 0,
              content: const Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                AppNavigator.pushReplacement(
                  context,
                  const RootPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
