import 'package:clot_shop/common/helper/bloc/product/cubit/product_cubit.dart';
import 'package:clot_shop/common/widgets/app_bar/basic_app_bar.dart';
import 'package:clot_shop/domain/product/usecases/get_product_by_title_usecase.dart';
import 'package:clot_shop/presentation/search/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/product/product_card.dart';
import '../../../core/configs/assets/assets.dart';
import '../../../service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        usecase: sl<GetProductByTitleUsecase>(),
      ),
      child: Scaffold(
        appBar: const BasicAppBar(
          height: 80,
          title: SearchTextField(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is ProductLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(${state.products.length}) Found Results',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (state.products.isEmpty)
                            _emptySearch(state)
                          else
                            _productsLoaded(state),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emptySearch(ProductLoaded state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesEmptySearch,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 24),
            const Text(
              'Sorry, we couldn\'t find any matching result for your Search.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            BasicAppButton(
              onPressed: () {},
              title: 'Explore Categories',
            ),
          ],
        ),
      ),
    );
  }

  GridView _productsLoaded(ProductLoaded state) {
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
