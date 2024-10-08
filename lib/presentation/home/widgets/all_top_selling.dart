import 'package:clot_shop/common/helper/bloc/product/cubit/product_cubit.dart';
import 'package:clot_shop/domain/product/entities/product_entity.dart';
import 'package:clot_shop/domain/product/usecases/get_top_selling_usecase.dart';
import 'package:clot_shop/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/app_bar/basic_app_bar.dart';
import '../../../common/widgets/product/product_grid_view.dart';

class AllTopSelling extends StatelessWidget {
  final List<ProductEntity> entity;

  const AllTopSelling({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        usecase: sl<GetTopSellingUsecase>(),
      )..getProducts(),
      child: Scaffold(
        appBar: const BasicAppBar(),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Top Selling (${state.products.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (state.products.isEmpty)
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: const Center(
                                child: Text(
                                  'No Products Found!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          else
                            ProductGridView(state: state),
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
}
